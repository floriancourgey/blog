ROP TABLE IF EXISTS xtksessioninfo;
CREATE TABLE xtksessioninfo(
  sImsToken VARCHAR(2000),
  sKey VARCHAR(512),
  sLogin VARCHAR(64),
  sRemoteAddr VARCHAR(50),
  sToken VARCHAR(50),
  tsExpiration TIMESTAMPTZ
);
