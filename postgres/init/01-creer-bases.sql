-- Creation des bases de l'ERP RTS : une base par service, aucun service ne lit la base d'un autre.
-- Execute une seule fois par l'image postgres a l'initialisation du volume.

CREATE DATABASE erp_identity  WITH ENCODING 'UTF8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
CREATE DATABASE erp_finance   WITH ENCODING 'UTF8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
CREATE DATABASE erp_commerce  WITH ENCODING 'UTF8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
CREATE DATABASE erp_paie      WITH ENCODING 'UTF8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
CREATE DATABASE erp_reporting WITH ENCODING 'UTF8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;

COMMENT ON DATABASE erp_identity  IS 'ERP RTS - utilisateurs, roles, permissions, societes, JWT';
COMMENT ON DATABASE erp_finance   IS 'ERP RTS - comptabilite generale/tiers/analytique, fiscalite, banque, tresorerie, immobilisations';
COMMENT ON DATABASE erp_commerce  IS 'ERP RTS - articles, stocks, achats, ventes, marches publics';
COMMENT ON DATABASE erp_paie      IS 'ERP RTS - dossiers salaries, paie, conges, RH';
COMMENT ON DATABASE erp_reporting IS 'ERP RTS - etats financiers OHADA, DSF, exports (lecture seule)';

-- Extensions utiles dans chaque base.
\connect erp_identity
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "unaccent";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

\connect erp_finance
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "unaccent";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

\connect erp_commerce
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "unaccent";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

\connect erp_paie
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "unaccent";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

\connect erp_reporting
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "unaccent";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";
