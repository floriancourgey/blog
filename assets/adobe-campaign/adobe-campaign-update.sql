CREATE OR REPLACE FUNCTION public.digest(text, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_digest$function$
;
CREATE OR REPLACE FUNCTION public.digest(bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_digest$function$
;
CREATE OR REPLACE FUNCTION public.hmac(text, text, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_hmac$function$
;
CREATE OR REPLACE FUNCTION public.hmac(bytea, bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_hmac$function$
;
CREATE OR REPLACE FUNCTION public.crypt(text, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_crypt$function$
;
CREATE OR REPLACE FUNCTION public.gen_salt(text)
 RETURNS text
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pg_gen_salt$function$
;
CREATE OR REPLACE FUNCTION public.gen_salt(text, integer)
 RETURNS text
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pg_gen_salt_rounds$function$
;
CREATE OR REPLACE FUNCTION public.encrypt(bytea, bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_encrypt$function$
;
CREATE OR REPLACE FUNCTION public.decrypt(bytea, bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_decrypt$function$
;
CREATE OR REPLACE FUNCTION public.encrypt_iv(bytea, bytea, bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_encrypt_iv$function$
;
CREATE OR REPLACE FUNCTION public.decrypt_iv(bytea, bytea, bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_decrypt_iv$function$
;
CREATE OR REPLACE FUNCTION public.gen_random_bytes(integer)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pg_random_bytes$function$
;
CREATE OR REPLACE FUNCTION public.gen_random_uuid()
 RETURNS uuid
 LANGUAGE c
 PARALLEL SAFE
AS '$libdir/pgcrypto', $function$pg_random_uuid$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt(text, text)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt_bytea(bytea, text)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt(text, text, text)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt_bytea(bytea, text, text)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt(bytea, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt_bytea(bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt(bytea, text, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt_bytea(bytea, text, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt(text, bytea)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt(text, bytea, text)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea, text)
 RETURNS bytea
 LANGUAGE c
 STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt(bytea, bytea)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt(bytea, bytea, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt(bytea, bytea, text, text)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_text$function$
;
CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text, text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_bytea$function$
;
CREATE OR REPLACE FUNCTION public.pgp_key_id(bytea)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_key_id_w$function$
;
CREATE OR REPLACE FUNCTION public.armor(bytea)
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_armor$function$
;
CREATE OR REPLACE FUNCTION public.armor(bytea, text[], text[])
 RETURNS text
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_armor$function$
;
CREATE OR REPLACE FUNCTION public.dearmor(text)
 RETURNS bytea
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pg_dearmor$function$
;
CREATE OR REPLACE FUNCTION public.pgp_armor_headers(text, OUT key text, OUT value text)
 RETURNS SETOF record
 LANGUAGE c
 IMMUTABLE STRICT
AS '$libdir/pgcrypto', $function$pgp_armor_headers$function$
;
CREATE OR REPLACE FUNCTION public.droptableifexists(text)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
DECLARE
  strTable text;
BEGIN
  strTable = Lower($1);
  SELECT tablename into strTable from pg_tables WHERE tablename=strTable;
  if strTable is not null then
    execute 'drop table ' || strTable;
    RETURN 't';
  end if;
  RETURN 'f';
END;
$function$
;
CREATE OR REPLACE FUNCTION public.getdate()
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select clock_timestamp() as result
$function$
;
CREATE OR REPLACE FUNCTION public.adddays(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  res timestamptz;
begin
  if $2 >= 0 then
    res = $1 + cast(text($2*86400) as interval);
  else
    res = $1 - cast(text(-$2*86400) as interval);
  end if;
  res = res + (extract(timezone from $1) - extract(timezone from res) ) * '1 second'::interval ;
  return res;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.addhours(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  res timestamptz;
begin
  if $2 >= 0 then
    res = $1 + cast(text($2*3600) as interval);
  else
    res = $1 - cast(text(-$2*3600) as interval);
  end if;
  return res;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.addminutes(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  res timestamptz;
begin
  if $2 >= 0 then
    res = $1 + cast(text($2*60) as interval);
  else
    res = $1 - cast(text(-$2*60) as interval);
  end if;
  return res;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.addseconds(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  res timestamptz;
begin
  if $2 >= 0 then
    res = $1 + cast(text($2) as interval);
  else
    res = $1 - cast(text(-$2) as interval);
  end if;
  return res;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.addseconds(timestamp with time zone, double precision)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  res timestamptz;
begin
  if $2 >= 0 then
    res = $1 + cast(text($2) as interval);
  else
    res = $1 - cast(text(-$2) as interval);
  end if;
  return res;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.subdays(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select AddDays($1, -$2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.subhours(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select AddHours($1, -$2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.subminutes(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select AddMinutes($1, -$2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.subseconds(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select AddSeconds($1, -$2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.subseconds(timestamp with time zone, double precision)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select AddSeconds($1, -$2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.daysago(integer)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select AddDays(GetDate(), -$1) as result
$function$
;
CREATE OR REPLACE FUNCTION public.daysdiff(timestamp with time zone, timestamp with time zone)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return Extract(days from $1-$2);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.hoursdiff(timestamp with time zone, timestamp with time zone)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return Trunc(Extract(epoch from $1-$2)/3600);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.minutesdiff(timestamp with time zone, timestamp with time zone)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return Trunc(Extract(epoch from $1-$2)/60);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.secondsdiff(timestamp with time zone, timestamp with time zone)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return Trunc(Extract(epoch from $1-$2));
end;
$function$
;
CREATE OR REPLACE FUNCTION public.truncdate(timestamp with time zone, integer, text)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return (timestamp '1970-01-01 00:00:00' + Trunc(Extract(epoch from $1 at time zone $3 - timestamp '1970-01-01 00:00:00')/$2)*$2* interval '1 second') at time zone $3;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.dateonly(timestamp with time zone, text)
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select TruncDate($1, 86400, $2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.trunctime(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return AddSeconds(timestamp '2000-01-01 00:00:00-00',
                    Floor((Extract(HOUR FROM $1)*3600 + Extract(MINUTE FROM $1)*60 + Extract(SECOND FROM $1))/$2) * $2);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.months_between(timestamp with time zone, timestamp with time zone)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return extract(years from $1)*12+extract(months from $1) - extract(years from $2)*12-extract(months from $2);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.years_between(timestamp with time zone, timestamp with time zone)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return extract(years from $1) - extract(years from $2);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.add_months(timestamp with time zone, integer)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  if $2 >= 0 then
    return $1 + cast(text($2)|| ' month' as interval);
  else
    return $1 - cast(text(-$2)|| ' month' as interval);
  end if;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.percent(double precision, double precision)
 RETURNS double precision
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return case when $2=0 then 0.0 else $1/$2 end;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.pgdecode(integer, integer, text, text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return case when $1=$2 then $3 else $4 end;
end;
$function$
;
CREATE OR REPLACE FUNCTION public."left"(text, integer)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return substr($1, 1, $2);
end;
$function$
;
CREATE OR REPLACE FUNCTION public."right"(text, integer)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  iLen integer;
begin
  iLen = char_length($1);
  if $2 > iLen then
    return $1;
  end if;
  return substr($1, iLen-$2+1, iLen);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getline(text, integer)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  vstr text[];
begin
  vstr := regexp_split_to_array($1, E'(\\r\\n)|\\n|\\r');
  return vstr[$2];
end;
$function$
;
CREATE OR REPLACE FUNCTION public.smart(text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  iLen integer;
  i integer;
  iAscii integer;
  bNextInUpper integer;
  strOut text;
  strChar text;
begin
  if $1 IS NULL then
    return NULL;
  end if;
  strOut := '';
  bNextInUpper := 1;
  iLen := char_length($1);
  for i in 1 .. iLen loop
    strChar := SUBSTR($1, i, 1);
    IF bNextInUpper = 1 THEN
      strOut := strOut || UPPER(strChar);
    ELSE
      strOut := strOut || LOWER(strChar);
    END IF;
    iAscii = ASCII(strChar);
    IF iAscii >= 128 then
      iAscii = ASCII(SUBSTRING('..,F,.||^%S<O....''''"".--~TS>O..Y !CLXY|S"CA<--R-O+23''UP.,10>...?AAAAAAACEEEEIIIIDNOOOOO*OUUUUY.SAAAAAAACEEEEIIIIDNOOOOO/OUUUUY.Y', iAscii-127, 1));
    ELSE
      iAscii = ASCII(upper(strChar));
    END IF;
    IF (iAscii >= 65 and iAscii <= 90) OR (iAscii >= 48 and iAscii <= 57) then
      bNextInUpper = 0;
    ELSE
      bNextInUpper = 1;
    END IF;
  end loop;
  RETURN strOut;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.juxtwords(text, text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  strOut text;
begin
  strOut = '';
  IF $1 IS NOT NULL and $1 <> '' THEN
    strOut = $1;
  END IF;
  IF $2 IS NOT NULL and $2 <> '' THEN
    IF strOut <> '' THEN
      strOut = strOut || ' ';
    END IF;
    strOut = strOut || $2;
  END IF;
  RETURN strOut;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.juxtwords3(text, text, text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return JuxtWords(JuxtWords($1, $2), $3);
end;
$function$
;
CREATE OR REPLACE FUNCTION public.allnonnull3(text, text, text)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  if $1 is null or $1 = '' or
     $2 is null or $2 = '' or
     $3 is null or $3 = '' then
    return 0;
  end if;
  return 1;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.allnonnull2(text, text)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  return AllNonNull3($1, $2, '1');
end;
$function$
;
CREATE OR REPLACE FUNCTION public.ismemonull(text)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  if $1 is null then
    return 1;
  end if;
  return 0;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.ifequals(text, text, text, text)
 RETURNS text
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
begin
  if $1 = $2 then
    return $3;
  end if;
  return $4;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.bin_or(numeric, integer)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
BEGIN
  return $1::integer | $2;
END;
$function$
;
CREATE OR REPLACE FUNCTION public.bin_and(numeric, integer)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
BEGIN
  return $1::integer & $2;
END;
$function$
;
CREATE OR REPLACE FUNCTION public.setbit(numeric, integer)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
BEGIN
  RETURN $1::integer | $2;
END;
$function$
;
CREATE OR REPLACE FUNCTION public.clearbit(numeric, integer)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
BEGIN
  RETURN $1::integer & ~$2;
END;
$function$
;
CREATE OR REPLACE FUNCTION public.isbitset(numeric, integer)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
BEGIN
  RETURN $1::integer & $2;
END;
$function$
;
CREATE OR REPLACE FUNCTION public.round(double precision, integer)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select Round(cast($1 as numeric), $2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.trunc(double precision, integer)
 RETURNS numeric
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select trunc(cast($1 as numeric), $2) as result
$function$
;
CREATE OR REPLACE FUNCTION public.createsequenceifnecessary(text, text, text)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
DECLARE
  strSeqLow text;
BEGIN
  strSeqLow = Lower($1);
  SELECT relname into strSeqLow from pg_statio_user_sequences WHERE relname=strSeqLow;
  if strSeqLow is null then
    execute 'CREATE SEQUENCE ' || $1 || ' START ' || $2 || ' maxvalue 2147483646 cycle ' || $3 ;
    RETURN 't';
  end if;
  RETURN 'f';
END;
$function$
;
CREATE OR REPLACE FUNCTION public.getnewid()
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare
  iId integer;
begin
  select into iId NextVal('XtkNewId');
  return iId;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getnewids(integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '';
  for i in 1 .. $1 loop
    select NextVal('XtkNewId') into iId ;
    if i > 1 then
      strIds := strIds || ',';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getnewxtkjoblogids(integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '';
  for i in 1 .. $1 loop
    select NextVal('XtkJobLogId') into iId ;
    if i > 1 then
      strIds := strIds || ',';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getorgunit(integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
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
$function$
;
CREATE OR REPLACE FUNCTION public.getnewnmsbroadlogids(integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '';
  for i in 1 .. $1 loop
    select NextVal('NmsBroadLogId') into iId ;
    if i > 1 then
      strIds := strIds || ',';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getnewnmstrackinglogids(integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '';
  for i in 1 .. $1 loop
    select NextVal('NmsTrackingLogId') into iId ;
    if i > 1 then
      strIds := strIds || ',';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getnewnmspropositionids(integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '';
  for i in 1 .. $1 loop
    select NextVal('NmsPropositionId') into iId ;
    if i > 1 then
      strIds := strIds || ',';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getnewnmsdlvtempids(integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '';
  for i in 1 .. $1 loop
    select NextVal('NmsDlvTempId') into iId ;
    if i > 1 then
      strIds := strIds || ',';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.nmsduplicategroup(integer, integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
begin
  INSERT INTO NmsRcpGrpRel (iGroupId, iRecipientid)
    SELECT $2, iRecipientId FROM NmsRcpGrpRel WHERE igroupid=$1;
  RETURN 0;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getmirrorurl(text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  sResult text;
begin
  SELECT Coalesce(E.sMirrorURL, O.sStringValue, '') INTO sResult FROM NmsExtAccount E, XtkOption O WHERE E.sName = $1 AND O.sName='NmsServer_MirrorPageUrl';
  return sResult;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getfolderfororgunit(text, integer)
 RETURNS integer
 LANGUAGE plpgsql
 IMMUTABLE
AS $function$
declare
  l_iFolderId integer;
begin
  if $1 = '' or $2 = 0 then
     l_iFolderId = NULL;
  else
    select f.iFolderId from XtkFolder f, NmsLocalOrgUnit ou into l_iFolderId
    where f.sModel = $1 and
          f.iFolderId <> 0 and
          f.iIsView = 0 and
          f.iOrgUnitId = ou.iLocalOrgUnitId and
          ou.iLocalOrgUnitId = $2
    order by f.iSystem, f.iFolderId
    limit 1;
  end if;
  return l_iFolderId;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getemaildomain(text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
begin
  return Substr($1, strpos($1, '@')+1, char_length($1));
end;
$function$
;
CREATE OR REPLACE FUNCTION public.md5digest(text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
BEGIN
  return encode(digest($1, 'md5' ), 'hex');
END;
$function$
;
CREATE OR REPLACE FUNCTION public.getofferenv(integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare
 l_iEnvId integer;
 l_iParentId integer;
begin
 select iParentId, case when smodel='nmsOfferEnv' then iFolderId else iEnvId end from XtkFolder WHERE iFolderId=$1 into l_iParentId, l_iEnvId;
 if l_iEnvId = 0 and l_iParentId <> 0 then
   l_iEnvId = GetOfferEnv(l_iParentId);
 end if;
 return l_iEnvId;
end;
$function$
;
CREATE OR REPLACE FUNCTION public.distance(double precision, double precision, double precision, double precision)
 RETURNS double precision
 LANGUAGE plpgsql
AS $function$
declare
  pi   	   constant double precision := 3.1416;
  toRad    constant double precision := 3.1416 / 180;
  rEarthKm constant integer          := 6371;
begin
  return rEarthKm * ( acos( sin($2*toRad)*sin($4*toRad) + cos($2*toRad)*cos($4*toRad)*cos(($1-$3)*toRad) ) );
end;
$function$
;
CREATE OR REPLACE FUNCTION public.getnewnmsmceventids(integer)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare
  strIds text;
  i integer;
  iId integer;
begin
  strIds = '';
  for i in 1 .. $1 loop
    select NextVal('NmsMcEventId') into iId ;
    if i > 1 then
      strIds := strIds || ',';
    end if;
    strIds := strIds || cast(iId as text);
  end loop;
  return strIds;
end;
$function$
;
