-- Sql script executed before table creation
-- (c) Neolane 2002-2010

----------------------------------
-- Procedures "CreateSequenceIfNecessary" --
----------------------------------

CREATE OR REPLACE FUNCTION CreateSequenceIfNecessary(text, text, text) returns BOOLEAN as '
DECLARE
  strSeqLow text;
BEGIN
  strSeqLow = Lower($1);
  SELECT relname into strSeqLow from pg_statio_user_sequences WHERE relname=strSeqLow;
  if strSeqLow is null then
    execute ''CREATE SEQUENCE '' || $1 || '' START '' || $2 || '' maxvalue 2147483646 cycle '' || $3 ;
    RETURN ''t'';
  end if;
  RETURN ''f'';
END;
' language plpgsql
;

----------------------------------
--   Database intialization     --
----------------------------------

-- Log: Creating Id generator
SELECT CreateSequenceIfNecessary('XtkNewId', '1000', 'cache 30');

create or replace function GetNewId() returns integer as '
declare
  iId integer;
begin
  select into iId NextVal(''XtkNewId'');
  return iId;
end;
' language plpgsql
;

create or replace function GetNewIds(integer) returns text as '
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '''';
  for i in 1 .. $1 loop
    select NextVal(''XtkNewId'') into iId ;
    if i > 1 then
      strIds := strIds || '','';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
' language plpgsql
;


SELECT CreateSequenceIfNecessary('XtkJobLogId', '1000', '');

create or replace function GetNewXtkJobLogIds(integer) returns text as '
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '''';
  for i in 1 .. $1 loop
    select NextVal(''XtkJobLogId'') into iId ;
    if i > 1 then
      strIds := strIds || '','';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
' language plpgsql
;

-- ----------------------------------------------------------------------------
-- Return the org unit for a given folder
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION GetOrgUnit(integer) returns integer as '
declare
 l_iOrgUnitId integer;
 l_iParentId integer;
begin
  select iParentId, iOrgUnitId from XtkFolder WHERE iFolderId=$1 into l_iParentId, l_iOrgUnitId;
  if l_iOrgUnitId = 0 and l_iParentId <> 0 then
    l_iOrgUnitId = GetOrgUnit(l_iParentId);
  end if;

 return l_iOrgUnitId;
end;
' language plpgsql
;
