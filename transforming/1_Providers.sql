DROP TABLE Providers;
CREATE TABLE Providers AS
SELECT
    provider_id,
    hospital_name,
    address,
    city,
    state,
    zip_code,
    county,
    phone
FROM ext_hospitals;