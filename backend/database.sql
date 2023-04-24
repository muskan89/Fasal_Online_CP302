-- Adminer 4.7.6 PostgreSQL dump

DROP TABLE IF EXISTS "about_chemical_fertilizer";
CREATE TABLE "public"."about_chemical_fertilizer" (
    "id" integer NOT NULL,
    "trade_name" character varying NOT NULL,
    "description" character varying,
    "formulation" character varying,
    "crops" character varying,
    "price" character varying,
    CONSTRAINT "about_chemical_fertilizer_pkey" PRIMARY KEY ("trade_name")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_disease";
CREATE TABLE "public"."about_disease" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer NOT NULL,
    CONSTRAINT "about_disease_pkey" PRIMARY KEY ("name")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_field_preparation";
CREATE TABLE "public"."about_field_preparation" (
    "type" character varying NOT NULL,
    "description" character varying,
    "crops" character varying,
    "procedure" character varying,
    "id" integer NOT NULL,
    CONSTRAINT "about_field_preparation_pkey" PRIMARY KEY ("type")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_nutrient_deficiency";
DROP SEQUENCE IF EXISTS about_nutrient_deficiency_id_seq;
CREATE SEQUENCE about_nutrient_deficiency_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 9 CACHE 1;

CREATE TABLE "public"."about_nutrient_deficiency" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_nutrient_deficiency_id_seq') NOT NULL,
    CONSTRAINT "about_nutrient_deficiency_pkey" PRIMARY KEY ("name")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_organic_manure";
DROP SEQUENCE IF EXISTS about_organic_manure_id_seq;
CREATE SEQUENCE about_organic_manure_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 5 CACHE 1;

CREATE TABLE "public"."about_organic_manure" (
    "trade_name" character varying NOT NULL,
    "description" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_organic_manure_id_seq') NOT NULL,
    CONSTRAINT "about_organic_manure_pkey" PRIMARY KEY ("trade_name")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_pest";
DROP SEQUENCE IF EXISTS about_pest_id_seq;
CREATE SEQUENCE about_pest_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 9 CACHE 1;

CREATE TABLE "public"."about_pest" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_pest_id_seq') NOT NULL,
    CONSTRAINT "about_pest_pkey" PRIMARY KEY ("name")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_rodent";
DROP SEQUENCE IF EXISTS about_rodent_id_seq;
CREATE SEQUENCE about_rodent_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 14 CACHE 1;

CREATE TABLE "public"."about_rodent" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_rodent_id_seq') NOT NULL,
    CONSTRAINT "about_rodent_pkey" PRIMARY KEY ("name")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_soil";
DROP SEQUENCE IF EXISTS about_soil_id_seq;
CREATE SEQUENCE about_soil_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 9 CACHE 1;

CREATE TABLE "public"."about_soil" (
    "type" character varying NOT NULL,
    "description" character varying,
    "crops" character varying,
    "states" character varying,
    "id" integer DEFAULT nextval('about_soil_id_seq') NOT NULL,
    CONSTRAINT "about_soil_pkey" PRIMARY KEY ("type")
) WITH (oids = false);


DROP TABLE IF EXISTS "about_weed";
DROP SEQUENCE IF EXISTS about_weed_id_seq;
CREATE SEQUENCE about_weed_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 3 CACHE 1;

CREATE TABLE "public"."about_weed" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_weed_id_seq') NOT NULL,
    CONSTRAINT "about_weed_pkey" PRIMARY KEY ("name")
) WITH (oids = false);


DROP TABLE IF EXISTS "admin";
DROP SEQUENCE IF EXISTS admin_id_seq;
CREATE SEQUENCE admin_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 5 CACHE 1;

CREATE TABLE "public"."admin" (
    "id" integer DEFAULT nextval('admin_id_seq') NOT NULL,
    "username" character varying NOT NULL,
    "password" character varying NOT NULL,
    "name" character varying(100),
    "fname" character varying,
    "address" character varying,
    "state" character(100),
    "distt" character(100),
    "email" character varying,
    "mobile" bigint,
    "photo" character varying,
    "usertype" character(100),
    "permission" character varying,
    "createdat" timestamp,
    CONSTRAINT "admin_pkey" PRIMARY KEY ("id", "username")
) WITH (oids = false);


DROP TABLE IF EXISTS "auth_group";
DROP SEQUENCE IF EXISTS auth_group_id_seq;
CREATE SEQUENCE auth_group_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group" (
    "id" integer DEFAULT nextval('auth_group_id_seq') NOT NULL,
    "name" character varying(150) NOT NULL,
    CONSTRAINT "auth_group_name_key" UNIQUE ("name"),
    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING btree ("name");

DROP TABLE IF EXISTS "django_content_type";
DROP SEQUENCE IF EXISTS django_content_type_id_seq;
CREATE SEQUENCE django_content_type_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 7 CACHE 1;

CREATE TABLE "public"."django_content_type" (
    "id" integer DEFAULT nextval('django_content_type_id_seq') NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL,
    CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model"),
    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "auth_permission";
DROP SEQUENCE IF EXISTS auth_permission_id_seq;
CREATE SEQUENCE auth_permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 28 CACHE 1;

CREATE TABLE "public"."auth_permission" (
    "id" integer DEFAULT nextval('auth_permission_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL,
    CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename"),
    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING btree ("content_type_id");


DROP TABLE IF EXISTS "auth_group_permissions";
DROP SEQUENCE IF EXISTS auth_group_permissions_id_seq;
CREATE SEQUENCE auth_group_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."auth_group_permissions" (
    "id" bigint DEFAULT nextval('auth_group_permissions_id_seq') NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id"),
    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING btree ("group_id");

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING btree ("permission_id");




DROP TABLE IF EXISTS "auth_user";
DROP SEQUENCE IF EXISTS auth_user_id_seq;
CREATE SEQUENCE auth_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user" (
    "id" integer DEFAULT nextval('auth_user_id_seq') NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(150) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamptz NOT NULL,
    CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_username_key" UNIQUE ("username")
) WITH (oids = false);

CREATE INDEX "auth_user_username_6821ab7c_like" ON "public"."auth_user" USING btree ("username");


DROP TABLE IF EXISTS "auth_user_groups";
DROP SEQUENCE IF EXISTS auth_user_groups_id_seq;
CREATE SEQUENCE auth_user_groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_groups" (
    "id" bigint DEFAULT nextval('auth_user_groups_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL,
    CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq" UNIQUE ("user_id", "group_id"),
    CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_groups_group_id_97559544" ON "public"."auth_user_groups" USING btree ("group_id");

CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "public"."auth_user_groups" USING btree ("user_id");


DROP TABLE IF EXISTS "auth_user_user_permissions";
DROP SEQUENCE IF EXISTS auth_user_user_permissions_id_seq;
CREATE SEQUENCE auth_user_user_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_user_permissions" (
    "id" bigint DEFAULT nextval('auth_user_user_permissions_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id"),
    CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "public"."auth_user_user_permissions" USING btree ("permission_id");

CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "public"."auth_user_user_permissions" USING btree ("user_id");


DROP TABLE IF EXISTS "chemical_fertilizer";
DROP SEQUENCE IF EXISTS chemical_fertilizer_id_seq;
CREATE SEQUENCE chemical_fertilizer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 28 CACHE 1;

CREATE TABLE "public"."chemical_fertilizer" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "trade_name" character varying NOT NULL,
    "cycle" character varying,
    "id" integer DEFAULT nextval('chemical_fertilizer_id_seq') NOT NULL,
    "amount" character varying,
    "amount_min" double precision,
    "amount_max" double precision,
    CONSTRAINT "chemical_fertilizer_pkey" PRIMARY KEY ("state", "crop_id", "trade_name")
) WITH (oids = false);

DROP TABLE IF EXISTS "crop";
DROP SEQUENCE IF EXISTS crop_id_seq;
CREATE SEQUENCE crop_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 19 CACHE 1;

CREATE TABLE "public"."crop" (
    "id" integer DEFAULT nextval('crop_id_seq') NOT NULL,
    "name" character varying NOT NULL,
    "description" character varying,
    "species" character varying,
    "category" character varying,
    "season" character varying,
    "botanical_name" character varying,
    "genus" character varying,
    "family" character varying,
    "origin" character varying,
    "synonym" character varying,
    "rotations" character varying,
    "cropimage" character varying,
    "average_yield" character varying,
    "yield_min" double precision,
    "yield_max" double precision,
    CONSTRAINT "crop_pkey" PRIMARY KEY ("id")
) WITH (oids = false);



DROP TABLE IF EXISTS "climate";
DROP SEQUENCE IF EXISTS climate_id_seq;
CREATE SEQUENCE climate_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 14 CACHE 1;

CREATE TABLE "public"."climate" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "type" character varying,
    "temperature" character varying,
    "rainfall" character varying,
    "humidity" character varying,
    "id" integer DEFAULT nextval('climate_id_seq') NOT NULL,
    "temperature_min" double precision,
    "temperature_max" double precision,
    "rainfall_min" double precision,
    "rainfall_max" double precision,
    "humidity_min" double precision,
    "humidity_max" double precision,
    CONSTRAINT "climate_pkey" PRIMARY KEY ("state", "crop_id"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);




DROP TABLE IF EXISTS "crop_pattern";
DROP SEQUENCE IF EXISTS crop_pattern_id_seq;
CREATE SEQUENCE crop_pattern_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 5 CACHE 1;

CREATE TABLE "public"."crop_pattern" (
    "crop_id" integer NOT NULL,
    "intercrop" character varying,
    "id" integer DEFAULT nextval('crop_pattern_id_seq') NOT NULL,
    CONSTRAINT "crop_pattern_pkey" PRIMARY KEY ("crop_id")
) WITH (oids = false);


DROP TABLE IF EXISTS "disease";
DROP SEQUENCE IF EXISTS disease_id_seq;
CREATE SEQUENCE disease_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 69 CACHE 1;

CREATE TABLE "public"."disease" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "type" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('disease_id_seq') NOT NULL,
    "common_name" character varying,
    "disease_image" character varying(1000),
    CONSTRAINT "disease_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "django_admin_log";
DROP SEQUENCE IF EXISTS django_admin_log_id_seq;
CREATE SEQUENCE django_admin_log_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."django_admin_log" (
    "id" integer DEFAULT nextval('django_admin_log_id_seq') NOT NULL,
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" text NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING btree ("content_type_id");

CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING btree ("user_id");




DROP TABLE IF EXISTS "django_migrations";
DROP SEQUENCE IF EXISTS django_migrations_id_seq;
CREATE SEQUENCE django_migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 20 CACHE 1;

CREATE TABLE "public"."django_migrations" (
    "id" bigint DEFAULT nextval('django_migrations_id_seq') NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "django_session";
CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
) WITH (oids = false);

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING btree ("expire_date");

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING btree ("session_key");


DROP TABLE IF EXISTS "field_preparation";
DROP SEQUENCE IF EXISTS field_preparation_id_seq;
CREATE SEQUENCE field_preparation_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 24 CACHE 1;

CREATE TABLE "public"."field_preparation" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "type" character varying NOT NULL,
    "procedure" character varying,
    "schedule" character varying NOT NULL,
    "id" integer DEFAULT nextval('field_preparation_id_seq') NOT NULL,
    CONSTRAINT "field_preparation_pkey" PRIMARY KEY ("state", "crop_id", "type", "schedule"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "notification_data";
DROP SEQUENCE IF EXISTS notification_data_id_seq;
CREATE SEQUENCE notification_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."notification_data" (
    "state" character varying,
    "notification_title" character varying,
    "notification_body" character varying,
    "days_gap_after_sowing_min" integer,
    "related_to_activity" character varying,
    "id" integer DEFAULT nextval('notification_data_id_seq') NOT NULL,
    "days_gap_after_sowing_max" integer,
    "cropid" integer,
    CONSTRAINT "notification_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "nutrient_deficiency";
DROP SEQUENCE IF EXISTS nutrient_deficiency_id_seq;
CREATE SEQUENCE nutrient_deficiency_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 27 CACHE 1;

CREATE TABLE "public"."nutrient_deficiency" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('nutrient_deficiency_id_seq') NOT NULL,
    CONSTRAINT "nutrient_deficiency_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "organic_manure";
DROP SEQUENCE IF EXISTS organic_manure_id_seq;
CREATE SEQUENCE organic_manure_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 17 CACHE 1;

CREATE TABLE "public"."organic_manure" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "trade_name" character varying NOT NULL,
    "cycle" character varying,
    "id" integer DEFAULT nextval('organic_manure_id_seq') NOT NULL,
    "amount" character varying,
    CONSTRAINT "organic_manure_pkey" PRIMARY KEY ("state", "crop_id", "trade_name")
) WITH (oids = false);


DROP TABLE IF EXISTS "pest";
DROP SEQUENCE IF EXISTS pest_id_seq;
CREATE SEQUENCE pest_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 56 CACHE 1;

CREATE TABLE "public"."pest" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('pest_id_seq') NOT NULL,
    "pest_image" character varying(500),
    CONSTRAINT "pest_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "portal_core_users";
DROP SEQUENCE IF EXISTS portal_core_users_id_seq;
CREATE SEQUENCE portal_core_users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."portal_core_users" (
    "id" integer DEFAULT nextval('portal_core_users_id_seq') NOT NULL,
    "username" character varying(200) NOT NULL,
    "password" character varying(200) NOT NULL,
    "email" character varying(200) NOT NULL,
    "created_on" date NOT NULL,
    "last_login" date NOT NULL,
    CONSTRAINT "portal_core_users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "rodent";
DROP SEQUENCE IF EXISTS rodent_id_seq;
CREATE SEQUENCE rodent_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 8 CACHE 1;

CREATE TABLE "public"."rodent" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('rodent_id_seq') NOT NULL,
    CONSTRAINT "rodent_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "soil";
DROP SEQUENCE IF EXISTS soil_id_seq;
CREATE SEQUENCE soil_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 34 CACHE 1;

CREATE TABLE "public"."soil" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "type" character varying NOT NULL,
    "water_content" character varying,
    "ph" character varying,
    "id" integer DEFAULT nextval('soil_id_seq') NOT NULL,
    "water_content_min" integer,
    "water_content_max" integer,
    "ph_min" double precision,
    "ph_max" double precision,
    CONSTRAINT "soil_pkey" PRIMARY KEY ("crop_id", "state", "type"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "user_info";
DROP SEQUENCE IF EXISTS user_info_id_seq;
CREATE SEQUENCE user_info_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 5 CACHE 1;

CREATE TABLE "public"."user_info" (
    "id" integer DEFAULT nextval('user_info_id_seq') NOT NULL,
    "mobile_number" character varying NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying,
    "state" character varying NOT NULL,
    "password" character varying NOT NULL,
    CONSTRAINT "user_info_mobile_number_key" UNIQUE ("mobile_number"),
    CONSTRAINT "user_info_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "varieties_in_state";
CREATE TABLE "public"."varieties_in_state" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "varieties" character varying,
    CONSTRAINT "varieties_in_state_pkey" PRIMARY KEY ("state", "crop_id"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "variety";
DROP SEQUENCE IF EXISTS variety_id_seq;
CREATE SEQUENCE variety_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 233 CACHE 1;

CREATE TABLE "public"."variety" (
    "id" integer DEFAULT nextval('variety_id_seq') NOT NULL,
    "crop_id" integer NOT NULL,
    "state" character varying,
    "variety_name" character varying NOT NULL,
    "seed_rate" character varying,
    "sowing_time" character varying,
    "duration" character varying,
    "average_yield" character varying,
    "height" character varying,
    "features" character varying,
    "suitable_regions" character varying,
    "tolerant_to" character varying,
    "added" timestamp DEFAULT CURRENT_TIMESTAMP,
    "v_image" character varying(1000),
    "seed_rate_min" integer,
    "seed_rate_max" integer,
    "duration_min" integer,
    "duration_max" integer,
    "average_yield_min" double precision,
    "average_yield_max" double precision,
    "height_min" double precision,
    "height_max" double precision,
    CONSTRAINT "variety_pkey" PRIMARY KEY ("variety_name", "crop_id"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "weed";
DROP SEQUENCE IF EXISTS weed_id_seq;
CREATE SEQUENCE weed_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 15 CACHE 1;

CREATE TABLE "public"."weed" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "measures" character varying,
    "id" integer DEFAULT nextval('weed_id_seq') NOT NULL,
    CONSTRAINT "weed_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


-- 2022-05-05 15:07:37.171693+05:30










DROP TABLE IF EXISTS "about_chemical_fertilizer";
CREATE TABLE "public"."about_chemical_fertilizer" (
    "id" integer NOT NULL,
    "trade_name" character varying NOT NULL,
    "description" character varying,
    "formulation" character varying,
    "crops" character varying,
    "price" character varying,
    CONSTRAINT "about_chemical_fertilizer_pkey" PRIMARY KEY ("trade_name")
) WITH (oids = false);

INSERT INTO "about_chemical_fertilizer" ("id", "trade_name", "description", "formulation", "crops", "price") VALUES
(5,	'Bio-fertilizer',	'Biofertilizers are ready to use live formulates of such beneficial microorganisms which on application to seed, root or soil mobilize the availability of nutrients by their biological activity in particular, and help build up the micro-flora and in turn the soil health in general.',	'1. Rhizobium(Symbiotic)
2. Azetobactor(Non-Symbiotic)
3. Phosphate solubilising Bacteria (P.S.B.)
4. Zinc Solublising Bacteria (ZSB)',	'Gram, Peas, Lentil, Moong, Urd, Cowpea, Arhar, Fodder Legumes, Oil, Forest Legumes, Onion, Potato, Tomato, Cauliflower, Chilly, Lady finger, Rapeseed, Linseed, Tobacco. Mulberry, Coconut, Spices, Fruits, Flowers. Plantation crops, Forest plants, Cotton, Sugarcane, Banana, Grapes, Papaya,Watermelon.',	'0');



DROP TABLE IF EXISTS "about_disease";
CREATE TABLE "public"."about_disease" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer NOT NULL,
    CONSTRAINT "about_disease_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

INSERT INTO "about_disease" ("name", "common_name", "description", "symptoms", "measures", "crops", "id") VALUES
('Fusarium moniliforme',	'Sheath Rot',	'Sheath rot affects all rice growing varieties, particularly in rain-fed rice ecosystems and is more prevalent during wet than dry seasons.
Its incidence increases with increasing planting density and in plants that provide entry points for the fungus, in the form of injuries and wounds caused by insects such as stem borers at panicle initiation stage.',	'Discoloration, rotting occurs on the leaf sheath that encloses the young panicles.
Irregular spots or lesions, with dark reddish brown margins and gray center.
Lesions enlarge and often coalesce and may cover the entire leaf sheath.',	'Seed treatment with Pseudomonas fluorescens @ of 10g/kg of seed followed by seedling dip @ of 2.5 kg or products/ha dissolved in 100 litres and dipping for 30 minutes.
Removal of infected stubbles after harvest. Application of potash at tillering stage is also recommended.
Application of a systemic pesticide,Tridemorph (a fungicide) and phosphamidon (an insecticide) in combination protected the plants from sheath rot.',	'All varieties of rice.',	9);


DROP TABLE IF EXISTS "about_field_preparation";
CREATE TABLE "public"."about_field_preparation" (
    "type" character varying NOT NULL,
    "description" character varying,
    "crops" character varying,
    "procedure" character varying,
    "id" integer NOT NULL,
    CONSTRAINT "about_field_preparation_pkey" PRIMARY KEY ("type")
) WITH (oids = false);

INSERT INTO "about_field_preparation" ("type", "description", "crops", "procedure", "id") VALUES
('Laser Levelling',	'Laser leveling is a process of smoothening the land surface (± 2 cm) from its average elevation using laser equipped drag buckets to achieveprecision in land leveling. Precision land leveling involves altering the fields in such a way as to create a constant slope of 0 to 0.2%. This practice makes use of large horsepower tractors and soil movers that are equipped with global postioning systems (GPS) and/or laser-guided instrumentation so that the soil can be moved either by cutting or filling to create the desired slope/level.',	'Rice, wheat',	'Punjab. Haryana, Uttar Pradesh.',	4);



DROP TABLE IF EXISTS "about_nutrient_deficiency";
DROP SEQUENCE IF EXISTS about_nutrient_deficiency_id_seq;
CREATE SEQUENCE about_nutrient_deficiency_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."about_nutrient_deficiency" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_nutrient_deficiency_id_seq') NOT NULL,
    CONSTRAINT "about_nutrient_deficiency_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

INSERT INTO "about_nutrient_deficiency" ("name", "common_name", "description", "symptoms", "measures", "crops", "id") VALUES
('Iron Deficiency',	'Iron Deficiency',	'Iron is needed by plants for the synthesis of chloroplast proteins and various enzymes.
It appears on young leaves about three weeks after transplanting. Plants die and often the crop fails completely.',	'Light green to yellow interveinal chlorosis on newly emerging leaves and young shoots. It is common to see shoots dying from the tip inwards. In severe cases, newly emerged leaves may reduce in size and turn nearly white, with necrotic spots.',	'Apply solid FeSO4 (30 kg Fe/ha)
Foliar applications of FeSO4 (2-3% solution) 2-3 applications at 2 week intervals.
Use acidifying fertilizers (e.g., ammonium sulfate instead of urea) on high-pH soils.
Grow tolerant cultivars for low soil Fe availability.',	'Wheat, Rice, Sugarcane, Sorghum, Olive, Millet, Maize, Lentil, Cotton, Coffee, Fruits, Vegetables etc.',	9);

DROP TABLE IF EXISTS "about_organic_manure";
DROP SEQUENCE IF EXISTS about_organic_manure_id_seq;
CREATE SEQUENCE about_organic_manure_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."about_organic_manure" (
    "trade_name" character varying NOT NULL,
    "description" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_organic_manure_id_seq') NOT NULL,
    CONSTRAINT "about_organic_manure_pkey" PRIMARY KEY ("trade_name")
) WITH (oids = false);

INSERT INTO "about_organic_manure" ("trade_name", "description", "crops", "id") VALUES
('Green manure',	'Green manure is a cover crop sown on an agricultural plot in order to fertilize the soil mainly through the intake of nitrogen. This cover crop is sown between two sales crops or in combination with the previous crop. 
Green Manures (Seed rate):- Sithagathi (Sesbania speciosa): 30 – 40 (kg/ha); Dhaincha (Sesbania aculeata): 50 (kg/ha) ; Manila Agathi - Sesbania rostrata:40 (kg/ha); Sunnhemp (Crotalaria juncea): 25-30 (kg/ha); Wild Indigo (Tephrosia purpurea): 15-20 (kg/ha).',	'Maize, Mustard, Wheat, Rice, Sorghum, Millet, Maize, Lentil, Cotton, Fruits, Vegetables etc.',	4);

DROP TABLE IF EXISTS "about_pest";
DROP SEQUENCE IF EXISTS about_pest_id_seq;
CREATE SEQUENCE about_pest_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."about_pest" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_pest_id_seq') NOT NULL,
    CONSTRAINT "about_pest_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

INSERT INTO "about_pest" ("name", "common_name", "description", "symptoms", "measures", "crops", "id") VALUES
('Grasshoppers',	'Grasshoppers, Locust',	'Grasshopper, any of a group of jumping insects  that are found in a variety of habitats. Grasshoppers occur in greatest numbers in lowland tropical forests, semiarid regions, and grasslands. They range in colour from green to olive or brown and may have yellow or red markings.',	'Irregular feeding on leaves.',	'Spray 94 ml Pexalon 10 SC (triflumezopyrim) or 80 g Osheen 20 SG (dinotefuran) or 120 g Chess 50 WG (pymetrozine) or 800 ml Ekalux/Quinguard/Quinalmass 25 EC (quinalphos) in 100 litres of water per acre. Repeat the spray if necessary. For better effectiveness, use knapsack sprayer while directing its spray towards the base of the plants. If the damage is noticed at hopper burn stage, treat the affected spots alongwith their 3-4 metre periphery immediately as these spots harbour high population of the insect.',	'All crops.',	9);

DROP TABLE IF EXISTS "about_rodent";
DROP SEQUENCE IF EXISTS about_rodent_id_seq;
CREATE SEQUENCE about_rodent_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."about_rodent" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_rodent_id_seq') NOT NULL,
    CONSTRAINT "about_rodent_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

INSERT INTO "about_rodent" ("name", "common_name", "description", "symptoms", "measures", "crops", "id") VALUES
('Rats and mice',	'Rats',	'Rats are the most notorious pests of different commodities in the fields as well as when these commodities are stored. A number of crops like vegetables, oilseeds, cereals etc., at early stage in field, are eaten and contaminated by rats.',	'Droppings: The shape, size and appearance of droppings can provide information as to the species of rodent and the degree of infestation
Runs and tracks and Footprints and tail marks: Runs, are to be found along the foot of walls, fences or across rubble.Rats and mice leave footprints and tail marks in the dust.
Burrows and nests: Depending on their habits, rodents either build nests inside the store in corners as well as in the roof area or in burrows outside the store.',	'Environmental and cultural methods: these directly or indirectly reduce the immigration of rodents into a habitat and/or reduce the carrying capacity of the habitat.
Food source reduction: weeds are an important component of the diet of rodents The practice of weed control with chemicals and other techniques reduce rodent pest problems in crop fields.
Mechanical methods: mechanical techniques such as hunting, killing and trapping.
Chemical methods: the use of rodenticides is the common approach to rodent control in agricultural,.
Subacute rodenticides: rodenticides with subacute action, that is where death is delayed for several days after ingestion of a lethal amount, are bromethalin, flupropadine, calciferol (ergocalciferol, vitamin D2) and cholecalciferol (vitamin D3).',	'Wheat, Rice, Sugarcane, Maize, Pearl millet, Cotton, Groundnut, Soybean, Bengal gram, Vegetables, Horticulture Fruits.',	14);

DROP TABLE IF EXISTS "about_soil";
DROP SEQUENCE IF EXISTS about_soil_id_seq;
CREATE SEQUENCE about_soil_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."about_soil" (
    "type" character varying NOT NULL,
    "description" character varying,
    "crops" character varying,
    "states" character varying,
    "id" integer DEFAULT nextval('about_soil_id_seq') NOT NULL,
    CONSTRAINT "about_soil_pkey" PRIMARY KEY ("type")
) WITH (oids = false);

INSERT INTO "about_soil" ("type", "description", "crops", "states", "id") VALUES
('Loamy soil',	'It is a combination of sand, silt and clay such that the beneficial properties from each is included. For instance, it has the ability to retain moisture and nutrients; hence, it is more suitable for farming. This soil is also referred to as agricultural soil as it includes an equilibrium of all three types of soil materials being sandy, clay, and silt and it also happens to have humus',	'Rice, cotton, oilseeds, sugarcane, wheat, pulses, jute, vegetables, Fruits',	'Punjab ,Haryana ,Bihar ,UP',	8),
('Black Soil',	'Black soil is formed by the weathering or breaking process of igneous rocks. Then by cooling or solidification of lava originated from the volcano eruption. Hence, it is also called lava soil. Black soil is also referred to as regular soil or cotton soil in India. Black soil is rich in minerals like iron, lime, calcium, potash, magnesium and aluminium & also  high water-retaining capacity.',	'Cotton, Tobacco, Chilly, Oilseeds, Jowar, RicE',	'Maharashtra, Gujarat, Andhra Pradesh, Chhattisgarh, Madhya Pradesh',	9);

DROP TABLE IF EXISTS "about_weed";
DROP SEQUENCE IF EXISTS about_weed_id_seq;
CREATE SEQUENCE about_weed_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."about_weed" (
    "name" character varying NOT NULL,
    "common_name" character varying,
    "description" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "crops" character varying,
    "id" integer DEFAULT nextval('about_weed_id_seq') NOT NULL,
    CONSTRAINT "about_weed_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

INSERT INTO "about_weed" ("name", "common_name", "description", "symptoms", "measures", "crops", "id") VALUES
('Annual grasses and broad leaf weeds',	'Carrot Grass, Gajar ghas, Chatak Chandani, Carry me seed, Hazar dana, Bhui aonla, Jarmala, Jangli imli, Common spurge, Asthma weed, Bari dudhi, Silver/white cocks comb,Gadrya, Garkha, Purslane, Lunia,  Green amaranthus, Pig weed, Jangali chaulai, Asian yellow spider flower, Tick weed, Bagra, Horse purslane, Giant pig weed, Sabuni, Vishakhapara, Creeping dayflower, Kanshura, Blue pimpernel, Krishananeel, Neel, Dharti Dhak,  Lambs quarter, White goosefoot, Fat hen, Bathua, Bur Clover, Bur medic, Toothed medic.',	'Plants which are unwanted in the field and have large broad leaves.',	'These grasses can be seen with naked eye in the field.',	'Hand weeding, Hand pulling, Pudding, Flooding',	'Rice, wheat, sorghum, maize, groundnut, sunflower, cotton,pulses, tobacco, sugarcane etc.',	3);


-----------------------------------


DROP TABLE IF EXISTS "admin";
DROP SEQUENCE IF EXISTS admin_id_seq;
CREATE SEQUENCE admin_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."admin" (
    "id" integer DEFAULT nextval('admin_id_seq') NOT NULL,
    "username" character varying NOT NULL,
    "password" character varying NOT NULL,
    "name" character varying(100),
    "fname" character varying,
    "address" character varying,
    "state" character(100),
    "distt" character(100),
    "email" character varying,
    "mobile" bigint,
    "photo" character varying,
    "usertype" character(100),
    "permission" character varying,
    "createdat" timestamp,
    CONSTRAINT "admin_pkey" PRIMARY KEY ("id", "username")
) WITH (oids = false);

INSERT INTO "admin" ("id", "username", "password", "name", "fname", "address", "state", "distt", "email", "mobile", "photo", "usertype", "permission", "createdat") VALUES
(5,	'karan99',	'Karan@1234',	'Karan',	'Rajinder Singh',	'Village: Majri, P.O. Sarsa nangal',	'Punjab                                                                                              ',	'Rupnagar(Ropar)                                                                                     ',	'kvermi02@gmail.com',	8289075058,	'idfOwjNbvA.jpg',	'user                                                                                                ',	'p_1|p_2|p_3|p_4|p_5|p_6|p_7|p_8|p_9|p_10|p_11|p_12|p_13|p_14|p_15|p_16|p_17|p_18|p_19|p_20|p_21|p_22',	NULL),
(1,	'admin',	'adminbtp',	'admin',	'Team',	'None',	'Punjab                                                                                              ',	'Ropar                                                                                               ',	'awadh@iirpr.ac.in',	9876543210,	'MBORqPYcA1.jpg',	'user                                                                                                ',	'p_1|p_2|p_3|p_4|p_5|p_6|p_7|p_8|p_9|p_10|p_11|p_12|p_13|p_14|p_15|p_16|p_17|p_18|p_19|p_20|p_21|p_22',	NULL),
(2,	'master-admin',	'ramramram',	'Vinay',	'Rajkumar',	'Hisar',	'Haryana                                                                                             ',	'Hisar                                                                                               ',	'vinay.kumar@iitrpr.ac.in',	9466687998,	NULL,	'Master                                                                                              ',	'p_1|p_2|p_3|p_4|p_5|p_6|p_7|p_8|p_9|p_10|p_11|p_12|p_13|p_14|p_15|p_16|p_17|p_18|p_19|p_20|p_21|p_22 ',	NULL);

DROP TABLE IF EXISTS "auth_group";
DROP SEQUENCE IF EXISTS auth_group_id_seq;
CREATE SEQUENCE auth_group_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_group" (
    "id" integer DEFAULT nextval('auth_group_id_seq') NOT NULL,
    "name" character varying(150) NOT NULL,
    CONSTRAINT "auth_group_name_key" UNIQUE ("name"),
    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE INDEX "auth_group_name_a6ea08ec_like" ON "public"."auth_group" USING btree ("name");


DROP TABLE IF EXISTS "auth_group_permissions";
DROP SEQUENCE IF EXISTS auth_group_permissions_id_seq;
CREATE SEQUENCE auth_group_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."auth_group_permissions" (
    "id" bigint DEFAULT nextval('auth_group_permissions_id_seq') NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" UNIQUE ("group_id", "permission_id"),
    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "public"."auth_group_permissions" USING btree ("group_id");

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "public"."auth_group_permissions" USING btree ("permission_id");


DROP TABLE IF EXISTS "auth_permission";
DROP SEQUENCE IF EXISTS auth_permission_id_seq;
CREATE SEQUENCE auth_permission_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_permission" (
    "id" integer DEFAULT nextval('auth_permission_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL,
    CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename"),
    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING btree ("content_type_id");

INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES
(1,	'Can add log entry',	1,	'add_logentry'),
(2,	'Can change log entry',	1,	'change_logentry'),
(3,	'Can delete log entry',	1,	'delete_logentry'),
(4,	'Can view log entry',	1,	'view_logentry'),
(5,	'Can add permission',	2,	'add_permission'),
(6,	'Can change permission',	2,	'change_permission'),
(7,	'Can delete permission',	2,	'delete_permission'),
(8,	'Can view permission',	2,	'view_permission'),
(9,	'Can add group',	3,	'add_group'),
(10,	'Can change group',	3,	'change_group'),
(11,	'Can delete group',	3,	'delete_group'),
(12,	'Can view group',	3,	'view_group'),
(13,	'Can add user',	4,	'add_user'),
(14,	'Can change user',	4,	'change_user'),
(15,	'Can delete user',	4,	'delete_user'),
(16,	'Can view user',	4,	'view_user'),
(17,	'Can add content type',	5,	'add_contenttype'),
(18,	'Can change content type',	5,	'change_contenttype'),
(19,	'Can delete content type',	5,	'delete_contenttype'),
(20,	'Can view content type',	5,	'view_contenttype'),
(21,	'Can add session',	6,	'add_session'),
(22,	'Can change session',	6,	'change_session'),
(23,	'Can delete session',	6,	'delete_session'),
(24,	'Can view session',	6,	'view_session'),
(25,	'Can add core_users',	7,	'add_core_users'),
(26,	'Can change core_users',	7,	'change_core_users'),
(27,	'Can delete core_users',	7,	'delete_core_users'),
(28,	'Can view core_users',	7,	'view_core_users');

DROP TABLE IF EXISTS "auth_user";
DROP SEQUENCE IF EXISTS auth_user_id_seq;
CREATE SEQUENCE auth_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."auth_user" (
    "id" integer DEFAULT nextval('auth_user_id_seq') NOT NULL,
    "password" character varying(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" boolean NOT NULL,
    "username" character varying(150) NOT NULL,
    "first_name" character varying(150) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "email" character varying(254) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamptz NOT NULL,
    CONSTRAINT "auth_user_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_username_key" UNIQUE ("username")
) WITH (oids = false);

CREATE INDEX "auth_user_username_6821ab7c_like" ON "public"."auth_user" USING btree ("username");


DROP TABLE IF EXISTS "auth_user_groups";
DROP SEQUENCE IF EXISTS auth_user_groups_id_seq;
CREATE SEQUENCE auth_user_groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_groups" (
    "id" bigint DEFAULT nextval('auth_user_groups_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "group_id" integer NOT NULL,
    CONSTRAINT "auth_user_groups_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_groups_user_id_group_id_94350c0c_uniq" UNIQUE ("user_id", "group_id"),
    CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_groups_group_id_97559544" ON "public"."auth_user_groups" USING btree ("group_id");

CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "public"."auth_user_groups" USING btree ("user_id");


DROP TABLE IF EXISTS "auth_user_user_permissions";
DROP SEQUENCE IF EXISTS auth_user_user_permissions_id_seq;
CREATE SEQUENCE auth_user_user_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."auth_user_user_permissions" (
    "id" bigint DEFAULT nextval('auth_user_user_permissions_id_seq') NOT NULL,
    "user_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_user_user_permissions_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" UNIQUE ("user_id", "permission_id"),
    CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "public"."auth_user_user_permissions" USING btree ("permission_id");

CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "public"."auth_user_user_permissions" USING btree ("user_id");


---------------------

DROP TABLE IF EXISTS "chemical_fertilizer";
DROP SEQUENCE IF EXISTS chemical_fertilizer_id_seq;
CREATE SEQUENCE chemical_fertilizer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."chemical_fertilizer" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "trade_name" character varying NOT NULL,
    "cycle" character varying,
    "id" integer DEFAULT nextval('chemical_fertilizer_id_seq') NOT NULL,
    "amount" character varying,
    "amount_min" double precision,
    "amount_max" double precision,
    CONSTRAINT "chemical_fertilizer_pkey" PRIMARY KEY ("state", "crop_id", "trade_name")
) WITH (oids = false);

INSERT INTO "chemical_fertilizer" ("crop_id", "state", "trade_name", "cycle", "id", "amount", "amount_min", "amount_max") VALUES
(8,	'Punjab',	'Chemical Fertilizers',	'Apply the whole of phosphorus and potassium as per soil test before the puddling. Phosphorus can be top dressed up to 21 days after transplanting. , Apply nitrogen fertilizer in 3 equal splits to all recommended varities. The first split should be applied upto 7 days of transplating and second split at 21 days of transplating. The third split to short duration (PR 126 and PR 124) should be applied at 35 days of transplating while for other varieties, it should be applied at 42 days of transplating.',	5,	'Nutrients (kg per acre): N - 42 , P2O5 - 12, K2O - 12. Fertilizers (kg per acre): Neem coated urea - 90, DAP - 27, single superphosphate - 75, Muriate of potash - 20.',	NULL,	NULL),
(8,	'Punjab',	'Bio-fertilizer',	'Treat nursery roots before transplanting',	6,	'One packet',	NULL,	NULL),
(9,	'Punjab',	'Chemical Fertilizers',	'Apply urea in two equal splits at 3 weeks and 6 weeks after transplanting.',	7,	'CSR 30, Basmati 386 and Basmati 370 - 18 kg urea per acre ; Punjab Basmati 7, 5, 4 & 3 and Pusa Basmati 1121, 1637 & 1718 - 36 kg urea per acre ; Pusa Basmati 1509 - 54 kg urea per acre',	NULL,	NULL),
(8,	'Maharashtra',	'Biofertilizer',	'Apply on  nursery roots before transplanting',	18,	'One packet',	NULL,	NULL),
(17,	'Maharashtra',	'Chemical Fertilizers (timely sown irrigated areas)',	'Apply half of Nitrogen dose and full dose of Phosphorus and Potash at time of seed sowing  and remaining dose of Nitrogen, three weeks after seed sowing.',	12,	'Nutrients (kg/acre) : Nitrogen-48,Phosphorus-24 Potash-16    Fertilizers (kg/acre):Neem coated urea-105,Single Super Phosphate-150,Muriate of Potash-30',	NULL,	NULL),
(17,	'Maharashtra',	'Chemical Fertilizers (For Rainfed areas)',	'Drilled all fertilizer at time of seed sowing.',	10,	'Nutrients (kg/acre) : Nitrogen-16,Phosphorus-8, Potash-8    Fertilizers (kg/acre):Neem coated urea-35,Single Super Phosphate-50,Muriate of Potash-15',	NULL,	NULL),
(17,	'Maharashtra',	'Chemical Fertilizers (late sown irrigated areas,)',	'Apply half of Nitrogen dose and full dose of Phosphorus and Potash at time of seed sowing. And remaining dose of Nitrogen, three weeks after seed sowing.',	13,	'Nutrients (kg/acre) : Nitrogen-32,Phosphorus-16 Potash-16    Fertilizers (kg/acre):Neem coated urea-70,Single Super Phosphate-110,Muriate of Potash-30',	NULL,	NULL),
(8,	'Maharashtra',	'Chemical Fertilizers(early maturing variety)',	'Apply fertilizer on the basis of soil test result. apply half dose of Nitrogen and full dose of Potash, Phosphorus at time of transplantation. Add remaining 50 Percentage of Nitrogen dose, 25 to 30days after transplantation.',	15,	'Nutrients (kg/acre) : Nitrogen-40,Phosphorus-20 Potash-20 Fertilizers (kg/acre):Neem coated urea-90,Single Super Phosphate-125,Muriate of Potash-35',	NULL,	NULL),
(8,	'Maharashtra',	'Chemical Fertilizers(Hybrid variety)',	'Apply fertilizer on the basis of soil test resul.Apply half dose of nitrogen and full dose of Phosphorus and Potash at time of transplantation. Apply remaining amount of nitrogen in two equal splits and apply first dose, 25-30days after transplantation where as second dose, 55-60days after transplantation.',	17,	'Nutrients (kg/acre) : Nitrogen-50,Phosphorus-20 Potash-20 Fertilizers (kg/acre):Neem coated urea-110,Single Super Phosphate-125,Muriate of Potash-35',	NULL,	NULL),
(17,	'Punjab',	'Chemical Fertilizers',	'At time of sowing, with first and second irrigation.',	8,	'Nutrients (kg/acre) : N- 50, P2O5- 25; Fertilizers (kg/acre): Neem coated urea-110, DAP-55, Superphosphate-155, Nitrophosphate- 125',	NULL,	NULL),
(8,	'Madhya Pradesh',	'Chemical Fertilizers(Hybrid and late variety)',	'Before fertilizer application, carried out soil test and  apply fertilizer on the basis of soil test result.Apply half dose of nitrogen and full dose of Phosphorus and Potash at time of transplantation. Apply remaining amount of nitrogen in two equal splits and apply first dose, 25-30days after transplantation where as second dose, 55-60days after transplantation.',	23,	'Fertilizers (kg/acre) : Nitrogen-50,Phosphorus-40 Potash-20',	NULL,	NULL),
(8,	'Maharashtra',	'Chemical Fertilizers(medium and Long duration variety)',	'Apply fertilizer on the basis of soil test result.apply (40%)  of Nitrogen and full dose of Phosphorus and Potash at time of transplantation. Divide remaining amount of Nitrogen fertilizer in two splits. Give 40 Percentage of Nitrogen, 25 to 30days after transplantation. Apply remaining 20 Percentage  of Nitrogen, 55-60days after transplantation.',	16,	'Nutrients (kg/acre) : Nitrogen-40,Phosphorus-20 Potash-20 Fertilizers (kg/acre):Neem coated urea-90,Single Super Phosphate-125,Muriate of Potash-35',	NULL,	NULL),
(8,	'Meghalaya',	'Chemical Fertilizers',	'At the time of final preparation',	19,	'SSP - 250kgs ; MOP - 23kg ; DAP - 80kgs.',	NULL,	NULL),
(8,	'Madhya Pradesh',	'Chemical Fertilizers(early maturing variety)',	'Before fertilizer application, carried out soil test and  apply fertilizer on the basis of soil test result. Apply  6-7 days after transplanting',	21,	'Fertilizers (kg/acre) : Nitrogen-40,Phosphorus-20 Potash-20',	NULL,	NULL),
(8,	'Madhya Pradesh',	'Chemical Fertilizers(medium duration variety)',	'Before fertilizer application, carried out soil test and  apply fertilizer on the basis of soil test result.',	22,	'Fertilizers (kg/acre) : Nitrogen-40,Phosphorus-30 Potash-25',	NULL,	NULL),
(17,	'Madhya Pradesh',	'Chemical Fertilizers (unirrigated)',	'Before fertilizer application, carried out soil test and apply fertilizer on the basis of soil test result.apply half the amount of nitrogen at the time of sowing.apply the remaining 1/4 at the time of first irrigation. Apply the remaining 1/4 at the time of second irrigation',	24,	'Fertilizers (kg/acre) : Nitrogen-40,Phosphorus-20, Potash-0',	NULL,	NULL),
(17,	'Madhya Pradesh',	'Chemical Fertilizers (semi irrigated)',	'Before fertilizer application, carried out soil test and apply fertilizer on the basis of soil test result.apply half the amount of nitrogen at the time of sowing.apply the remaining 1/4 at the time of first irrigation.apply the remaining 1/4 at the time of second irrigation',	25,	'Fertilizers (kg/acre) : Nitrogen-60,Phosphorus-30, Potash-15',	NULL,	NULL),
(17,	'Madhya Pradesh',	'Chemical Fertilizers (irrigated)',	'Before fertilizer application, carried out soil test and apply fertilizer on the basis of soil test result.apply half the amount of nitrogen at the time of sowing. Apply the remaining 1/4 at the time of first irrigation.apply the remaining 1/4 at the time of second irrigation',	26,	'Fertilizers (kg/acre) : Nitrogen-100Phosphorus-60, Potash-30',	NULL,	NULL),
(17,	'Madhya Pradesh',	'Chemical Fertilizers (Late)',	'Before fertilizer application, carried out soil test and apply fertilizer on the basis of soil test result.apply half the amount of nitrogen at the time of sowing.apply the remaining 1/4 at the time of first irrigation.apply the remaining 1/4 at the time of second irrigation',	27,	'Fertilizers (kg/acre) : Nitrogen-80,Phosphorus-40, Potash-20',	NULL,	NULL),
(10,	'Maharashtra',	'Chemical Fertilizers',	'Apply 1/3rd of Nitrogen fertilizer and whole dose of Potash and Phosphorus fertilizer at time of sowing. Apply remaining quantity of Urea in two equal splits, first 30days after seed sowing and second 40-45days after sowing.',	28,	'Nutrients (kg/acre) : Nitrogen-50,Phosphorus-24, Potash-16 Fertilizers (kg/acre):Neem coated urea-105,Single Super Phosphate-150,Muriate of Potash-30',	NULL,	NULL);


INSERT INTO "crop" ("id", "name", "description", "species", "category", "season", "botanical_name", "genus", "family", "origin", "synonym", "rotations", "cropimage", "average_yield", "yield_min", "yield_max") VALUES
(10,	'Maize',	'It is a staple food for human being and quality feed for animals, maize serves as a basic raw material as an ingredient to thousands of industrial products that includes starch, oil, protein, alcoholic beverages, food sweeteners, pharmaceutical, cosmetic, film, textile, gum, package and paper industries etc.',	'Mays',	'Kharif',	'Fall, Winter',	'Zea mays',	'Corn',	'Poaceae',	'Poales',	'Corn, Sweet corn',	'Maize-Wheat/Barley/Potato/Berseem, Maize-Senji-Sugarcane-Cotton, Maize-Wheat- Moong, Maize-Wheat-Green Manure, Maize-Potato/Toria-Sunflower, Maize-Potato- Wheat/Sunflower, Maize-Early Pea-Sunflower, Maize-Wheat-Cowpea (fodder), Maize- Raya/Gobhi Sarson, Maize-Potato-Summer Moong, Maize-Potato-Mentha, Maize-Gobhi Sarson-Summer Moong.',	'X1mOfjsigd.jpg',	'15',	NULL,	NULL),
(17,	'Wheat',	'Wheat is the second most important staple food after rice consumed by 65% of the population in India. Wheat is mostly consumed in the form of chapati in our country for which bread wheat is cultivated in nearly 95 per cent of the cropped area. Durum wheat, which is most suitable for making macaroni, noodles, semolina and pasta products.',	'Triticum',	'Rabi',	'Winter',	'Triticum',	'Wheat',	'Poaceae',	'Poales',	'Durum, Cereal',	'Rice-Wheat, Rice-Wheat-Summer Moong/Mash, Cotton-Wheat, Maize-Wheat, Maize/Rice-Potato-Wheat, Moong/Arhar/Mash-Wheat, Groundnut- Wheat, Early Fodder-Toria-Wheat, Green Manure-Rice-Wheat, Rice-Pea-Wheat, Soybean-Wheat, Summer Groundnut-Potato/Toria/Pea/Late Kharif Fodder-Wheat, Maize (August)-Wheat-Bajra Fodder.',	'U5jqaLWuPx.jpg',	'20',	NULL,	NULL),
(8,	'Rice',	'Rice is grown under so diverse soil and climatic conditions that it is said that there is hardly any type of soil in which it cannot be grown including alkaline and acidic soils. Major share of rice is cultivated during Kharif season. A small share of rice is grown in rabi /summer season with assured irrigation.',	'O. sativa',	'Kharif',	'fall, winter, summer',	'Oryza sativa',	'Oryza',	'Poaceae',	'Poales',	'Grain, Cereal',	'Rice-Wheat / Berseem / Linseed / Gram / Barley, Rice-Wheat / Summer Moong/Green manuring, Rice-Celery, Rice-Potato/Peas-Celery, Rice-Potato-Potato/Summer Moong/ Sunflower/Celery/Wheat/Cucurbits, Rice-Toria-Sunflower, Rice-Gram-Summer Moong, Rice-Gobhi Sarson-Summer Moong, DSR-Potato-Mentha/Onion.',	'npvkxJ0Fpr.jpeg',	'24',	NULL,	NULL),
(9,	'Basmati Rice',	'Basmati is long grain aromatic rice with characteristics extra- long slender grains that elongate at least twice of their original size with a characteristics soft and fluffy texture upon cooking, delicious taste, superior aroma and distinct flavour.',	'O. sativa',	'Kharif',	'fall, winter, summer',	'Oryza sativa',	'Oryza',	'Poaceae',	'Poales',	'Grain, Cereal',	'Basmati Rice-Wheat/Sunflower, Basmati Rice-Wheat-Summer Moong, Basmati Rice- Mentha, Basmati Rice-Berseem (Fodder & seed), Basmati Rice-Celery-Bajra (Fodder), DSBR-Potato-Mentha.',	'k9iRAsIb7S.jpg',	'15',	NULL,	NULL);



DROP TABLE IF EXISTS "climate";
DROP SEQUENCE IF EXISTS climate_id_seq;
CREATE SEQUENCE climate_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."climate" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "type" character varying,
    "temperature" character varying,
    "rainfall" character varying,
    "humidity" character varying,
    "id" integer DEFAULT nextval('climate_id_seq') NOT NULL,
    "temperature_min" double precision,
    "temperature_max" double precision,
    "rainfall_min" double precision,
    "rainfall_max" double precision,
    "humidity_min" double precision,
    "humidity_max" double precision,
    CONSTRAINT "climate_pkey" PRIMARY KEY ("state", "crop_id"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "climate" ("crop_id", "state", "type", "temperature", "rainfall", "humidity", "id", "temperature_min", "temperature_max", "rainfall_min", "rainfall_max", "humidity_min", "humidity_max") VALUES
(10,	'Punjab',	'Moisture and warmth',	'[[ 21, 32 ]]',	'[[ 50, 75 ]]',	'[low]',	6,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	'Punjab',	'Cool season',	'[16, 20]',	'[0, 0]',	'[0, 0]',	7,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	'Maharashtra',	'cool climate with moderate rainfall',	'[10,15]',	'[75,100]',	'[0,0]',	9,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	'Maharashtra',	'High temperature, High humidity, Prolonged Sunshine',	'[22, 39]',	'[100-298]',	'[High]',	8,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	'Madhya Pradesh',	'High temperature, High humidity',	'[22.3 , 42]',	'[80-160]',	'[High]',	10,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	'Madhya Pradesh',	'Cool climate with moderate rainfall',	NULL,	NULL,	'High',	12,	2,	45,	75,	150,	0,	0),
(8,	'Punjab',	'High temperature, High humidity, Prolonged sunshine',	'[[20 , 37.5]]',	'[[0, 0]]',	'High',	4,	20,	37.5,	0,	0,	NULL,	NULL),
(9,	'Punjab',	'High-Mid temperature, High humidity, Prolonged sunshine',	'[Mid-High]',	'[[0, 0]]',	'[High]',	5,	NULL,	NULL,	0,	0,	NULL,	NULL),
(10,	'Maharashtra',	'Moisture and warmth, moderate rainfall',	NULL,	NULL,	'Medium',	14,	25,	30,	50,	100,	NULL,	NULL);


DROP TABLE IF EXISTS "crop_pattern";
DROP SEQUENCE IF EXISTS crop_pattern_id_seq;
CREATE SEQUENCE crop_pattern_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."crop_pattern" (
    "crop_id" integer NOT NULL,
    "intercrop" character varying,
    "id" integer DEFAULT nextval('crop_pattern_id_seq') NOT NULL,
    CONSTRAINT "crop_pattern_pkey" PRIMARY KEY ("crop_id")
) WITH (oids = false);

INSERT INTO "crop_pattern" ("crop_id", "intercrop", "id") VALUES
(10,	'Cowpea fodder, Maize fodder, Soybean pods, Groundnut pods',	4),
(8,	'Rice-wheat, Rice-Gram, Rice-Oilseed',	3);

DROP TABLE IF EXISTS "disease";
DROP SEQUENCE IF EXISTS disease_id_seq;
CREATE SEQUENCE disease_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."disease" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "type" character varying,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('disease_id_seq') NOT NULL,
    "common_name" character varying,
    "disease_image" character varying(1000),
    CONSTRAINT "disease_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


INSERT INTO "disease" ("crop_id", "state", "name", "type", "symptoms", "measures", "id", "common_name", "disease_image") VALUES
(8,	'Punjab',	'Ustilaginoidea virens',	'Fungal',	'The individual grains transform into large yellowish/greenish velvety spore-balls.
The application of organic manures and high dose of nitrogenous fertilizers also increases the intensity of attack.',	'Give spray of 400 ml Galileo Way 18.76 SC (picoxystrobin + propiconazole) or 500 g Kocide 46 DF (copper hydroxide) in 200 litres of water per acre at boot stage of the crop in disease prone areas.',	13,	'False smut',	'yglckaG3Q9.jpg'),
(8,	'Punjab',	'Fusarium moniliforme',	'Fungal',	'The rot occurs on the uppermost leaf-sheaths where oblong to irregular and grey-brown to light-brown lesions develop. 
The lesions often coalesce to cover the entire sheath.
A white-powdery growth of the fungus appears on the panicle inside the sheath. 
The glumes of infected florets are discoloured, dark-red or purple brown to black and often do not fill.',	'Destroy the rice straw after harvesting the infected crop.
Give two sprays of 26.8 g Epic 75 WG (hexaconazole) in 200 litres of water per acre. The first spray should be given at boot stage and second 15 days afterwards.',	17,	'Sheath rot',	''),
(8,	'Punjab',	'Sclerotium oryzae',	'Fungal',	'It affects the stem at earing and black lesions are produced on the sheath at water level. 
Later on, the stem gets infected and rots leading to withering and lodging of the plant.',	'Destroy the diseased debris of infected crop. 
Avoid excessive irrigation.
Use recommended dose of nitrogenous fertilizer.',	18,	'Stem rot',	''),
(10,	'Punjab',	'Several fungi',	'Fungal',	'Poor germination.
Unthrifty seedlings.
Seedling mortality.',	'Use disease free seed.',	26,	'Seed rot and seedling blight',	''),
(10,	'Punjab',	'Rhizoctonia solani',	'Fungal',	'Water soaked, straw colored necrotic lesions alternating with dark brown bands develop on basal leaf sheaths. Lesions enlarge and coalesce with each other.
In severe cases, developing ears are completely damaged and dry up prematurely with cracking of husk.',	'Spray 100 ml Amistar Top 325 SC (azoxystrobin + difenoconazole) in 200 litres of water per acre at disease appearance. If needed, repeat the spray at 15 days interval.',	27,	'Banded leaf and sheath blight',	''),
(8,	'Punjab',	'Drechslera oryzae',	'Fungal',	'It produces oval, eye-shaped spots with a conspicuous dark-brown dot in the centre and light brown margin.
Spots are also produced on the grains.',	'Two sprays of 80 g Nativo 75 WG (trifloxystrobin + tebuconazole) in 200 litres of water/acre. First spray at boot stage of crop and second spray after 15 days.',	14,	'Brown leaf spot',	'9IVCC4b3wv.jpg'),
(8,	'Maharashtra',	'Ustilaginoides virens',	'Fungal',	'The individual grains transform into large yellowish/greenish/blackish velvety spore-balls.The application of organic manures and high dose of nitrogenous fertilizers also increases the intensity of attack.',	'500 g Kocide 46 DF (copper hydroxide) or Give spray of 400 ml Galileo Way 18.76 SC (picoxystrobin + propiconazole) in 200 litres of water per acre at boot stage of the crop in disease prone areas.',	37,	'False smut',	'mzuqAeXcrH.jpg'),
(8,	'Punjab',	'Neovossia horrida',	'Infectious',	'Frequently, only a part of the grain is replaced by a black powder. 
Sometimes, entire grain is also attacked and the black powder scatters on to other grains or leaves,',	'Avoid heavy doses of nitrogenous fertilizers.',	16,	'Bunt/Kernel Smut',	'7zDJ9nxD7c.png'),
(8,	'Punjab',	'Pyricularia grisea',	'Fungal',	'This causes spindle shaped spots with greyish centre and brown margin on the leaves at maximum tillering. 
It also causes brown lesions on the neck of the panicle, showing neck rot symptoms and the panicles fall over.',	'Spray the affected crop with 200 ml Amistar Top 325 SC (azoxystrobin + difenoconazole) or 500 g Indofil Z-78, 75 WP (zineb*) per acre in 200 litres of water, at the boot and ear-emergence stages.',	15,	'Blast',	'o7jzWowvtc.jpg'),
(8,	'Maharashtra',	'Neovossia horrida',	'Infectious',	'Few grains in panicle get affected first and part of grain gets converted into black powder. In severe condition whole panicle gets affected and black powder spread on leaves, grains etc.',	'Avoid heavy doses of nitrogenous fertilizers.tahuhu.When crop is at 10 percentage  flowering stage, take spray of Tilt 25 EC @200 ml/200 litre of water. Repeat the spray with interval of 10 days.',	39,	'Karnal Bunt',	'MbhwKmG5in.png'),
(17,	'Maharashtra',	'Urocystis agropyri',	'Fungal',	'It is seed borne disease. Infection spread through wind. It is favoured by cool, humid conditions during flowering period of the host plant.',	'Treat the seed with fungicides like carboxyl (Vitavax 75 WP @ 2.5 gm/kg of seeds), Carbendazim(Bavistin 50 WP)@2.5 gm/kg seed), Tebuconazole(Raxil 2 DS)@1.25 gm/kg of seed) if the disease level in the seed lot is high. If it is low to moderate, treat the seed with a combination of Trichoderma viride@4 gm/kg seed and half the recommended dose of Carboxin(Vitavax 75 WP)@1.25 gm/kg seed.',	40,	'Flag smut',	'qaV3fQmi0f.jpg'),
(17,	'Maharashtra',	'Erysiphaceae',	'Fungal',	'Powdery mildew is a fungal leaf disease that reduces yield and grain quality in susceptible wheat varieties. It has multiple, fast life cycles in a growing season and can be very hard to control once it is established, so strategies are outlined below to avoid or treat early infection.',	'When incidence of disease is observed, spray with wettable sulphur 2 gm/ Ltr of water or Carbendazim  400gm/acre. In case of high incidence, spray with Propiconazole 2 ml/ Ltr of water.',	41,	'Powdery mildew',	'MwzMsqfjc0.png'),
(17,	'Maharashtra',	'Puccinia triticina',	'Fungal',	'It is favoured by warm temperatures (15-30° C) and humid conditions. Brown rust is characterized by reddish- brown spores that occur in oval or elongated pustules. The disease can develop rapidly when free moisture is available and temperatures are near 20° C. Successive generations of urediospores can be produced every 10-14 days if conditions are favourable.',	'To Control this disease, follow mixed cropping with suitable crops. Avoid excessive use of Nitrogen fertilizer. Spray Zineb Z-78 400 gm/acre or Propiconazole 2ml/Litre of water.',	42,	'Brown rust',	'cdRlKyIM7s.jpg'),
(8,	'Punjab',	'Xanthomonas oryzae pv. oryzae',	'Fungal',	'Greenish-yellow stripes appear along the leaf margins and extend both lengthwise and breadthwise. 
The leaf starts drying from the tip, becomes white in severe cases and dries up completely. 
The disease sometimes attacks the freshly transplanted seedlings which start wilting and in a few days the whole clump dries up.',	'For the management of bacterial blight, grow rice varieties PR 129, PR 128, PR 127, PR 126, PR 124, PR 122, PR 121 and PR 113 which are resistant to most of the pathotypes of bacterial blight pathogen.
Use disesse free seed.
Do not grow nursery and crop under shade and near wheat straw stack (Kup)
Do not apply excessive dose of nitrogen. Nitrogen should not be applied beyond six weeks after transplanting (except when LCC is used).
Do not pond water in the field continuously.',	19,	'Bacterial blight',	''),
(8,	'Punjab',	'Xanthomonas oryzae pv. oryzicola',	'Bacterial',	'Small translucent streaks appear in the interveinal areas of the leaf. 
The streaks gradually enlarge and turn reddish, when the plants near maturity.',	'Use disease free seed.',	20,	'Bacterial leaf streak',	''),
(8,	'Punjab',	'Meloidogyne graminicola',	'Parasitic',	'The disease first appears in uneven yellow patches. 
The affected seedings show poor and patchy growth with chlorotic symptoms and characteristic terminal hook or bead like galls on the roots.',	'Apply mustard cake @ 40 g per square metre (1.0 kg per marla)10 days before sowing of nursery with last preparatory tillage operation after rauni. Also, practice puddling for nursery sowing.',	21,	'Root-knot Nematode',	''),
(9,	'Punjab',	'Fusarium moniliforme',	'Infectious',	'The infected seedlings turn pale yellow and become elongated. 
Later on these seedlings start drying from bottom and usually die. 
The symptoms also appear after transplanting in the field and the infected plants become taller than the normal plants and are killed after a few days. 
Adventitious roots also appear on the lower nodes. 
Pinkish growth of the fungus appears on the lower sheaths.',	'Use disease free seed
Treat the seed and seedlings as per recommendations.
Rogue out and destroy infected seedlings from nursery and field.',	22,	'Foot rot',	''),
(9,	'Punjab',	'Xanthomonas oryzae pv. oryzae',	'Fungal',	'Greenish-yellow stripes appear along the leaf margins and extend both lengthwise and breadthwise. The leaf starts drying from the tip, becomes white in severe cases and dries up completely. The disease sometimes attacks the freshly transplanted seedlings which start wilting and in a few days the whole clump dries up.',	'For the management of bacterial blight, grow rice varieties PR 129, PR 128, PR 127, PR 126, PR 124, PR 122, PR 121 and PR 113 which are resistant to most of the pathotypes of bacterial blight pathogen. 
Use disesse free seed. 
Do not grow nursery and crop under shade and near wheat straw stack.
Do not apply excessive dose of nitrogen. 
Nitrogen should not be applied beyond six weeks after transplanting (except when LCC is used). 
Do not pond water in the field continuously.',	24,	'Bacterial blight',	''),
(10,	'Punjab',	'Dickeya zeae',	'Bacterial',	'Water soaking and rotting of basal stem especially the leaf sheaths followed by rapid rotting of basal internodes. 
The rind loses its natural green colour and gives appearance as if boiled in water. 
The rotten stalks emit a characteristic fermenting odour and may break over from the second or third basal internode. 
The infected plants wilt.',	'Destroy the diseased plant debris.
Keep the fields well drained.',	29,	'Bacterial stalk rot',	''),
(10,	'Punjab',	'Sclerophthora rayssiae var zeae',	'Fungal',	'It is characterized by the presence of long, narrow, brownish, interveinal stripes on leaves. 
Whitish downy fungal growth may be observed on close examination on underside of the stripes.',	'Destroy the collateral host Takri grass (Digitaria sanguinalis) from the maize field. 
Keep the fields well drained. 
Spray 200 g Indofil M-45 (mancozeb) in100 litres of water after about a fortnight of sowing. Give two more sprays at 10-day intervals. 
Grow recommended varieties.',	30,	'Brown stripe downy mildew',	''),
(10,	'Punjab',	'Fusarium spp., Macrophomina spp., Cephalosporium spp.',	'Fungal & Bacterium',	'Plants wilt after flowering. 
The rind and basal internodes become discoloured. 
On splitting, the discolouration of the pith progressing upward is also seen.',	'Grow improved varieties such as PMH 13, PMH 11 and PMH 1).',	31,	'Post flowering stalk rots',	''),
(10,	'Punjab',	'Drechslera maydis',	'Fungal',	'This disease is characterized by the presence of spindle shaped, necrotic to brown lesions on the leaves. Such lesions may merge to form large, irregular patches. Sometimes the symptoms also appear on leaf sheaths, cob husks and ears.',	'Destroy the infected crop residue in the field. 
Grow improved varieties. 
Follow spray schedule as against Brown stripe downy mildew.',	28,	'Maydis leaf blight',	''),
(8,	'Maharashtra',	'Rhizoctonia solani',	'Bacterial or fungal',	'Plants affected by Meloidogyne graminicola  presents above ground symptoms of water and nutrient stress, yellowing, wilting, and stunting. Below ground galling on roots, bulbs, tubers is the typical symptom. Plant death may occur in high infestation level.',	'Avoid the excessive use of nitrogenous fertilizers.Avoid flow of irrigation water from infected fields to healthy fields.At maximum tillering to boot stage of crop, as soon as the disease appears, spray 150 ml Pulsor 24 SC (thifluzamide) or 26.8 g Epic 75 WG (hexaconazole) or 400 ml Galileo Way 18.76 SC (picoxystrobin + propiconazole) or 200 ml Amistar Top 325 SC or Tilt/Bumper/Pikapika 25 EC (propiconazole) or Folicur/Orius (tebuconazole) 25 EC or 80 g Nativo 75 WG (trifloxystrobin+tebuconazole) or 320 ml Lusture 37.5 SE (flusilazole + carbendazim) or 200 ml Monceren 250 SC (pencycuron) in 200 litres of water per acre. Give second spray 15 days thereafter.',	34,	'Sheath blight',	'6jjw81y2Hm.jpg'),
(8,	'Maharashtra',	'Pyricularia grisea',	'Fungal',	'Leaf ,Neck, Nodal are attacked by the fungus. It causes spindle shaped spots with greyish centre and brown margins on the leaves at maximum tillering stage. It also causes black lesions at the neck of panicle leading to its dropping.',	'To control this disease, spray per acre 200 ml Amistar Top 325 SC (azoxytrobin+difenoconazole) or 500 g Indofil Z-78 75 WP (zineb)* in 200 litre of water at maximum tillering and ear emergence stages.',	35,	'Rice Blast',	'OLjMVeXsXL.png'),
(8,	'Maharashtra',	'Helminthosporium oryzae  or  Drechslera oryzae',	'Fungal',	'Symptoms appear as lesions (spots) on the coleoptile, leaf blade, leaf sheath, and glumes, being most prominent on the leaf blade and glumes.The disease appears first as minute brown dots, later becoming cylindrical or oval to circular. The several spots coalesce and the leaf dries up.The seedlings die and affected nurseries can often be recognized from a distance by their brownish scorched appearance.',	'Two sprays of 80 g Nativo 75 WG (trifloxystrobin + tebuconazole) in 200 litres of water/acre. First spray at boot stage of crop and second spray after 15 days.',	36,	'Brown leaf spot or Bacterial Leaf Blight',	'Az6jtYinxK.png'),
(17,	'Punjab',	'Yellowing in the seedling stage',	'Fungal',	'A general yellowing of the leaves.
Necrosis occurs especially starting from the tips and along the edges. 
Later on, necrotic area develops within the chlorotic tissue, there is stunting and general decline.
Yellowing of young leaves may be due to sulphur deficiency.',	'In light soil, add 25 kg zinc sulphate per acre. One such application will be enough for 2-3 years.
Spray 3% urea solution (3 kg in 100 litres of water). To cover the crop thoroughly, spraying may be done cross-wise and a total volume of 300 litres of water per acre should be used.
Apply 100 kg gypsum per acre for correcting sulphur deficiency.',	43,	'',	''),
(17,	'Punjab',	'P. triticina',	'Fungal',	'Round, orange powdery pustules, irregularly arranged or in clusters on leaves, less common on the leaf sheath and stalk.',	'Grow rust resistant (PBW 824, PBW 869, PBW 803, DBW 222, DBW 187, PBW 725, Unnat PBW 343, Unnat PBW 550, PBW 1 Zn, HD 3226, PBW 771, PBW 757, WHD 943, PDW 291 and PBW 660) varieties.
Spray the crop with 200 ml Tilt 25 EC/Shine 25 EC/Bumper 25 EC/Stilt 25 EC/ Compass 25 EC/Markzole 25 EC (propiconazole) in 200 litres of water per acre as soon as the disease is noticed.',	45,	'Brown or leaf rust',	''),
(17,	'Punjab',	'Neovossia indica',	'Infectious',	'The infected grains on pressing give out black powder of spore mass. 
This powder gives peculiar stinking smell.',	'Grow resistant varieties namely WHD 943 and PDW 291. 
A single spray of 200 ml Tilt 25 EC (propiconazole) per acre using 200 litres of water at ear emergence stage for the control of Karnal bunt.',	46,	'Karnal bunt',	''),
(17,	'Punjab',	'Blumeria graminis tritici',	'Fungal',	'The fungus develops numerous superficial white floury spots on all the above ground parts of the plant. 
The white colour of the floury spots changes to grey or reddish brown when cleistothecia develop. 
Infected plants become stunted due to reduction in the size and number of leaves.',	'Spray with 120 g Nativo 75 WG (trifloxystrobin + tebuconazole) in 200 litres of water per acre.',	47,	'Powdery mildew',	''),
(17,	'Punjab',	'Ustilago segetum tritici',	'Fungal',	'The fungus destroys the ears completely, turning them into a black loose powdery mass consisting of spores and leaving behind the rachis only.',	'Grow resistant varieties such as WHD 943 and PDW 291.
Soak the wheat seed in ordinary water from 8 a.m. to 12 noon on any calm and sunny day during May/June. After 4 hours soaking, spread out the moist seed in the sun in a thin layer on cemented floor (pucca), on tarpaulin or sheets of cloth. Dry the seed completely and store in a dry place till sowing.',	48,	'Loose smut',	''),
(17,	'Punjab',	'Urocystis agropyri',	'Fungal',	'Long narrow lead grey or black streaks or stripes running parallel to veins are formed on the leaves. 
The stripes eventually rupture and expose black sooty mass of spores.',	'Practise shallow sowing. 
Rougue out the affected stools and destroy them by burning. 
Treat the seed with recommended fungicides. 
Varieties WHD 943 and PDW 291 are resistant to this disease.',	49,	'Flag smut or leaf-smut',	''),
(17,	'Punjab',	'Fusarium spp.',	'Fungal & Bacterium',	'Individual spikelets or portion of earheads show premature bleaching or brown discolouration. 
Characteristic pinkish mycelium of the fungus may be visible on infected spikelets during humid conditions. 
The grain formation is either completely inhibited or the infected spikelets produce shrivelled chalky grains showing pinkish discolouration.',	'Seed lots affected by scab should be cleaned thoroughly to eliminate shrivelled seeds. 
The incidence of this disease is more on durum varieties, their cultivation in highly humid areas, particularly near rivers should be avoided.',	50,	'Head blight or Scab',	''),
(17,	'Punjab',	'Leaf blight, glume blight and black tip of grains',	'Fungal & Bacterium',	'Elongated brown spots and blotches appear on leaves and glumes. 
Ears are poorly filled, grains shrivelled, discoloured and black tipped.',	'Use disease free seed.',	51,	'',	''),
(17,	'Punjab',	'Anguina tritici and Rathayi bacter tritici',	'Infectious & Fungal',	'Diseased plants have spreading tendency and swollen base, leaves become crinkled and twisted. 
Earheads contain dark-brown, hard and roundish galls (Mamni) instead of grains. 
Severely diseased plants are stunted and may die at seedling stage. 
Occurrence of yellow, slimy mass indicates ear rot phase which prevents grain and gall formation.',	'Put wheat seed in ordinary water and agitate vigorously for few minutes. Ear-cockle galls will float to the surface. These may be skimmed off with an ordinary sieve and burnt.',	53,	'Ear cockle (Mamni) and Yellow ear rot (tundu)',	''),
(17,	'Maharashtra',	'Puccinia striiformis',	'Fungal',	'The ideal growth conditions for yellow rust are temperatures of between 8-13° C for spore germination and penetration, and 12-15° C for further development and with free water. The yield penalties from yellow rust in wheat can range from 5 Percentage to as high as 30 Percentage  in high disease pressure scenarios. The pustules of stripe rust, which, contain yellow to orange-yellow urediospores, usually form narrow stripes on the leaves.',	'To  Control  the  disease, use rust resistant variety. Follow crop rotation and adopt mix cropping pattern. Avoid excess use of Nitrogen. When symptom observed, do dusting of Sulphur 5-10 kg/acre or take spray of Mancozeb  2 gm/Ltr or spray the crop with Propiconazole (Tilt) 25 EC  2 ml / litre of water.',	54,	'Stripe/Yellow rust',	'pDnpo2ldDr.png'),
(17,	'Maharashtra',	'Tilletia indica',	'Fungal',	'It is seed and soil borne disease. Infection occurs at flowering stage. Cloudy weather condition during spike emergence to grain filling stage of crop leads to development of disease. If the rains occur during the month of February in north Indian plains (disease-prone areas), the disease is likely to come with higher severity.',	'To Control of this disease use karnal bunt resistant varieties. For management of this disease, take one spray of Propiconazole (Tilt 25 EC) 2ml/ Ltr of water at ear head emergence stage.',	55,	'Karnal Bunt',	'17AnmBZHgT.jpg'),
(17,	'Punjab',	'Puccinia striiformis f.sp.tritici',	'Fungal',	'Yellow powdery pustules appear on leaves, forming stripes. 
The disease appears first in the sub-mountaineous areas of the state. 
Minimum temperature in the range of 7-13° coupled with 85-100% relative humidity during night and maximum temperature in the range of 15-24oC during day are congenial for infection, development and spread of disease.',	'Grow rust resistant (PBW 725, Unnat PBW 550, PBW 752, WHD 943, PDW 291 and PBW 660) varieties. 
Do not sow the crop in the month of October particularly in the disease prone sub- mountainous areas.
Spray the crop with 200 g Caviet 25 WG (tebuconazole) or 120 g Nativo 75 WG (trifloxystrobin + tebuconazole) or 200 ml Opera 18.3 SE (pyraclostrobin + epoxiconazole) or 200 ml Custodia 320 SC (azoxystrobin + tebuconazole) or 200 ml Tilt 25 EC/Shine 25EC/Bumper 25 EC/ Stilt 25 EC/Compass 25 EC/Markzole 25 EC (propiconazole) in 200 litres of water per acre as soon as the disease is noticed. 
Regularly monitor the crop and repeat the spray as per need.',	44,	'Yellow or stripe rust',	''),
(8,	'Maharashtra',	'Xanthomonas oryzae pv. Oryzae',	'Fungal',	'Greenish-yellow stripes appear along the leaf margins and extend both lengthwise and breadthwise. The leaf starts drying from the tip, becomes white in severe cases and dries up completely. The disease sometimes attacks the freshly transplanted seedlings which start wilting and in a few days the whole clump dries up.',	'Apply N in 3-4 splits. Avoid filed to filed irrigation .Destroy infected stubbles and weeds .',	56,	'Bacterial leaf blight',	'2VYPN9ZEsG.png'),
(8,	'Meghalaya',	'Brown Spot',	'Fungal',	'It produces oval dark brown spots on leaves, stems and plumes. 
When severe, causes heavy damage both in nursery and the field. 
The disease occurs mostly in deficient and poor soils.',	'* Use resistant varieties.
* Correct Soil deficiency by application of recommended and balance fertilizers.
Chemical Control :
* Seed treatment / dressing with Organo Mercurial fungicides like Agrosan GN or Thiram @ 2gms/kg seeds gives effective control of the disease.
* Spray pesticides with chemicals as per spray schedule in the case of blast.',	57,	'Brown Spot',	''),
(8,	'Meghalaya',	'Bacterial Blight',	'Bacterial',	'Bacterial disease with typical symptoms of yellow to white lesions along the margins, which may ultimately enlarge to cover the entire leaf. 
The infection occurs mostly during transplanting through injury to the roots and leaves. 
The disease spreads fast under favourable environmental conditions like incessant rains, strong winds and warm temperature.',	'* Use resistant varieties.
* Avoid excessive use of Nitrogenous fertilizers as increase Nitrogen increased the incidence of the disease due to luxuriant vegetative growth.
* Soak the seed 8-10 hours before planting in a solution of 1gm Streptocycline together with 10 gms Thiram for every 10 Litres of water.
Chemical Control : Spray the affected crop with Agrimycin 100 solution @ 5 gms in 18 litres water and repeat before grain formation.',	58,	'',	''),
(8,	'Meghalaya',	'Sheath Blight',	'Fungal & Bacterium',	'The disease initially affects the leaf sheath and under favourable conditions also affects the leaves.
The affected parts get blighted severely affecting the yields. Infected rice plants tends to lodge in the field.',	'* Avoid close planting and heavy nitrogenous fertilizer application.
Chemical Control : Spray the affected crop with fungicide as recommended earlier.',	60,	'',	''),
(8,	'Madhya Pradesh',	'Helminthosporium oryzae or Drechslera oryzae',	'Fungal',	'The disease is attacked from the plant till the stage of grain formation. The effect of this disease is the formation of eye-shaped spots on the main leaves, knots of the stem, earrings with ash color in the middle and dark brown or redness on the edges. Many spots combine to form large spots of brownish white color, due to which the plant gets scorched',	'Two sprays of 80 g Nativo 75 WG (trifloxystrobin + tebuconazole) in 200 litres of water/acre. First spray at boot stage of crop and second spray after 15 days.',	61,	'Blight disease (karpa)',	'W1AKUl7kP5.jpg'),
(8,	'Madhya Pradesh',	'Xanthomonas oryzae pv. Oryzae',	'Fungal',	'Greenish-yellow stripes appear along the leaf margins and extend both lengthwise and breadthwise. The leaf starts drying from the tip, becomes white in severe cases and dries up completely. The disease sometimes attacks the freshly transplanted seedlings which start wilting and in a few days the whole clump dries up.',	'Apply N in 3-4 splits. Avoid filed to filed irrigation .Destroy infected stubbles and weeds .',	62,	'Bacterial leaf',	'LF3oDs7BMe.png'),
(8,	'Madhya Pradesh',	'Ustilaginoides virens',	'Fungal',	'The individual grains transform into large yellowish/greenish/blackish velvety spore-balls.The application of organic manures and high dose of nitrogenous fertilizers also increases the intensity of attack.',	'500 g Kocide 46 DF (copper hydroxide) or Give spray of 400 ml Galileo Way 18.76 SC (picoxystrobin + propiconazole) in 200 litres of water per acre at boot stage of the crop in disease prone areas.',	63,	'False smut',	'VjpF1cZWRP.jpg'),
(17,	'Madhya Pradesh',	'Urocystis agropyri',	'Fungal',	'It is seed borne disease. Infection spread through wind. It is favoured by cool, humid conditions during flowering period of the host plant.',	'Treat the seed with fungicides like carboxyl (Vitavax 75 WP @ 2.5 gm/kg of seeds), Carbendazim(Bavistin 50 WP)@2.5 gm/kg seed), Tebuconazole(Raxil 2 DS)@1.25 gm/kg of seed) if the disease level in the seed lot is high. If it is low to moderate, treat the seed with a combination of Trichoderma viride@4 gm/kg seed and half the recommended dose of Carboxin(Vitavax 75 WP)@1.25 gm/kg seed.',	65,	'Flag smut',	'qaV3fQmi0f.jpg'),
(17,	'Madhya Pradesh',	'Erysiphaceae',	'Fungal',	'Powdery mildew is a fungal leaf disease that reduces yield and grain quality in susceptible wheat varieties. It has multiple, fast life cycles in a growing season and can be very hard to control once it is established, so strategies are outlined below to avoid or treat early infection.',	'When incidence of disease is observed, spray with wettable sulphur 2 gm/ Ltr of water or Carbendazim  400gm/acre. In case of high incidence, spray with Propiconazole 2 ml/ Ltr of water.',	66,	'Powdery mildew',	'MwzMsqfjc0.png'),
(17,	'Madhya Pradesh',	'Puccinia triticina',	'Fungal',	'It is favoured by warm temperatures (15-30° C) and humid conditions. Brown rust is characterized by reddish- brown spores that occur in oval or elongated pustules. The disease can develop rapidly when free moisture is available and temperatures are near 20° C. Successive generations of urediospores can be produced every 10-14 days if conditions are favourable.',	'To Control this disease, follow mixed cropping with suitable crops. Avoid excessive use of Nitrogen fertilizer. Spray Zineb Z-78 400 gm/acre or Propiconazole 2ml/Litre of water.',	67,	'Brown rust',	'cdRlKyIM7s.jpg'),
(17,	'Madhya Pradesh',	'Puccinia striiformis',	'Fungal',	'The ideal growth conditions for yellow rust are temperatures of between 8-13° C for spore germination and penetration, and 12-15° C for further development and with free water. The yield penalties from yellow rust in wheat can range from 5 Percentage to as high as 30 Percentage  in high disease pressure scenarios. The pustules of stripe rust, which, contain yellow to orange-yellow urediospores, usually form narrow stripes on the leaves.',	'To  Control  the  disease, use rust resistant variety. Follow crop rotation and adopt mix cropping pattern. Avoid excess use of Nitrogen. When symptom observed, do dusting of Sulphur 5-10 kg/acre or take spray of Mancozeb  2 gm/Ltr or spray the crop with Propiconazole (Tilt) 25 EC  2 ml / litre of water.',	68,	'Stripe/Yellow rust',	'pDnpo2ldDr.png'),
(17,	'Madhya Pradesh',	'Tilletia indica',	'Fungal',	'It is seed and soil borne disease. Infection occurs at flowering stage. Cloudy weather condition during spike emergence to grain filling stage of crop leads to development of disease. If the rains occur during the month of February in north Indian plains (disease-prone areas), the disease is likely to come with higher severity.',	'To Control of this disease use karnal bunt resistant varieties. For management of this disease, take one spray of Propiconazole (Tilt 25 EC) 2ml/ Ltr of water at ear head emergence stage.',	69,	'Karnal Bunt',	'17AnmBZHgT.jpg'),
(10,	'Maharashtra',	'Rhizoctonia solani',	'Fungal',	'Water soaked, straw colored necrotic lesions alternating with dark brown bands develop on basal leaf sheaths. Lesions enlarge and coalesce with each other. In severe cases, developing ears are completely damaged and dry up prematurely with cracking of husk',	'Use of resistant/tolerant hybrids.Spray 100 ml Amistar Top 325 SC (azoxystrobin + difenoconazole) in 200 litres of water per acre at disease appearance. If needed, repeat the spray at 15 days interval.',	64,	'Banded leaf and sheath blight',	'641X0i6h0z.jpg'),
(10,	'Maharashtra',	'Biopolaris maydis',	'Fungal',	'It generally appears in warm tropical and sub-tropical areas to wet temperate climate. Young lesions are small and diamond shaped. As they mature, they elongate. Lesions may coalesce, producing a complete “burning” of large areas of the leaves.',	'Destroy the infected crop residue in the field. Grow improved varieties.2-4 sprays of Diathane M-45 or Zineb @ 2.0-2.5 gm/liter of water at 7-10 days interval from the first appearance of disease controls the spread of pathogen.',	65,	'Maydis leaf blight (MLB)',	'1kN7na0adK.png'),
(10,	'Maharashtra',	'Dickeya zeae',	'Infectious',	'The stalk near the ground become water-soaked with brownish discoloration and are easily breakable and give unpleasant smell.',	'Destroy the diseased plant debris. Keep the fields well drained. Apply Bleaching powder containing 33 Percentage   chlorine@4 kg/acre as soil drench at pre-flowering stage.',	67,	'Bacterial stalk rot',	'UzJlqrmWB6.gif'),
(10,	'Maharashtra',	'Sclerophthora rayssiae var zeae',	'Fungal',	'Lesions start developing on lower leaves as narrow chlorosis or yellow stripes, 3-7 mm wide, with well-defined margin and are delimited by the veins. The stripes later become reddish to purple. Lateral development of lesions causes severe striping and blotching.',	'Grow resistant varieties. Do Seed treatment with Metalaxyl@6 gm/kg of seeds. Remove infected plant and destroyed away from the field. Spray with Metalaxyl@1 gm/Ltr or Metalaxyl + Mancozeb@ 2.5 gm/Ltr of water.',	68,	'Brown stripe downy mildew',	'XbeWgXfFVd.jpg'),
(10,	'Maharashtra',	'Pythium aphanidermatum',	'Fungal',	'In this disease, basal internodes become soft, dark brown water soaked, causing the plants lodge. Damaged internodes commonly twist before the plants lodge.',	'Remove remains of previous crop and keep field clean before sowing. Maintained optimum plant population in field. Do Soil drenching with Captan at basal internode (5-7 week growth stage)@1 gm/Ltr of water.',	69,	'Pythium stalk rot',	'3wx8r74lbA.jpg');



CREATE TABLE "public"."django_admin_log" (
    "id" integer DEFAULT nextval('django_admin_log_id_seq') NOT NULL,
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" text NOT NULL,
    "content_type_id" integer,
    "user_id" integer NOT NULL,
    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE,
    CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED DEFERRABLE
) WITH (oids = false);

CREATE TABLE "public"."django_content_type" (
    "id" integer DEFAULT nextval('django_content_type_id_seq') NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL,
    CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model"),
    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES
(1,	'admin',	'logentry'),
(2,	'auth',	'permission'),
(3,	'auth',	'group'),
(4,	'auth',	'user'),
(5,	'contenttypes',	'contenttype'),
(6,	'sessions',	'session'),
(7,	'portal',	'core_users');


DROP TABLE IF EXISTS "django_migrations";
DROP SEQUENCE IF EXISTS django_migrations_id_seq;
CREATE SEQUENCE django_migrations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."django_migrations" (
    "id" bigint DEFAULT nextval('django_migrations_id_seq') NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES
(1,	'contenttypes',	'0001_initial',	'2022-01-25 11:17:05.149134+05:30'),
(2,	'auth',	'0001_initial',	'2022-01-25 11:17:05.302494+05:30'),
(3,	'admin',	'0001_initial',	'2022-01-25 11:17:05.353587+05:30'),
(4,	'admin',	'0002_logentry_remove_auto_add',	'2022-01-25 11:17:05.370404+05:30'),
(5,	'admin',	'0003_logentry_add_action_flag_choices',	'2022-01-25 11:17:05.401346+05:30'),
(6,	'contenttypes',	'0002_remove_content_type_name',	'2022-01-25 11:17:05.453549+05:30'),
(7,	'auth',	'0002_alter_permission_name_max_length',	'2022-01-25 11:17:05.48262+05:30'),
(8,	'auth',	'0003_alter_user_email_max_length',	'2022-01-25 11:17:05.508662+05:30'),
(9,	'auth',	'0004_alter_user_username_opts',	'2022-01-25 11:17:05.538001+05:30'),
(10,	'auth',	'0005_alter_user_last_login_null',	'2022-01-25 11:17:05.568821+05:30'),
(11,	'auth',	'0006_require_contenttypes_0002',	'2022-01-25 11:17:05.579223+05:30'),
(12,	'auth',	'0007_alter_validators_add_error_messages',	'2022-01-25 11:17:05.602382+05:30'),
(13,	'auth',	'0008_alter_user_username_max_length',	'2022-01-25 11:17:05.654854+05:30'),
(14,	'auth',	'0009_alter_user_last_name_max_length',	'2022-01-25 11:17:05.666235+05:30'),
(15,	'auth',	'0010_alter_group_name_max_length',	'2022-01-25 11:17:05.700184+05:30'),
(16,	'auth',	'0011_update_proxy_permissions',	'2022-01-25 11:17:05.72387+05:30'),
(17,	'auth',	'0012_alter_user_first_name_max_length',	'2022-01-25 11:17:05.764677+05:30'),
(18,	'portal',	'0001_initial',	'2022-01-25 11:17:05.803243+05:30'),
(19,	'sessions',	'0001_initial',	'2022-01-25 11:17:05.853197+05:30'),
(20,	'portal',	'0002_auto_20220210_0129',	'2022-02-10 06:59:49.700475+05:30');




DROP TABLE IF EXISTS "django_session";
CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
) WITH (oids = false);

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING btree ("expire_date");

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING btree ("session_key");

INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES
('dr7mijrqxzjsmb1a3eeu9e517203utsz',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nCEij:xIqQy-M-W1nn3NAnjVSp-zrMTmQldeOKojXR4Obcao4',	'2022-02-08 11:20:21.382654+05:30'),
('0qwn4cyboif3m2segglobab724eirs1c',	'e30:1nZp5d:2lJEUUOaboxiBQiiMo_N27mHlx863iwoggKX56RGc44',	'2022-04-14 12:49:29.047021+05:30'),
('qs3k723hxe3ut8mx1zh9sobpv4mf9rgx',	'eyJsb2dnZWRJbiI6dHJ1ZSwidXNlciI6Ijk5OTM1Iiwic3RhdGUiOiJBbmRocmEgUHJhZGVzaCJ9:1nZ2rT:AQeZaa_c8o0iw7ViuuVYEXZyn5RI1FGS9jIjSRdT9Nk',	'2022-04-12 09:19:39.995555+05:30'),
('cuqcmw2y6n510ah6am87xe4p98mql78a',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nL1D9:PCHY6Ydbwe0Ak25JrbDmj9OddgVcoy00jD9UAm2uNwE',	'2022-03-04 16:44:03.97829+05:30'),
('we879wfg4fudtqnxn0j0vhsyrv0u2pl9',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nHg83:jdUVBTPgvrp22z6M8-4EgCGpZtT2soKOn3F3PSsnPfY',	'2022-02-23 11:36:59.857703+05:30'),
('dyjdfc74017ji653dpo2sv5yum1z0927',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nL4E7:pWwLIsS8nmKj7U-HsIMgp0TEDkXc6Cu6ZlZgf1BiCpk',	'2022-03-04 19:57:15.459053+05:30'),
('p6c2sdcshgf1xv8ex9u0odc25wf5051c',	'e30:1nLHe3:4_hLNOO_9DjUC6S0o_MV0euV-XkunLYE1XjHm7UNlc4',	'2022-03-05 10:16:55.968313+05:30'),
('depa2dyfs1eatou1fboiyehvhwlf8wh8',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nMCJ6:Iky0zONHg8hSn1uedDh-U0-K3w9GLplN2tRgT43o_a0',	'2022-03-07 22:47:04.579121+05:30'),
('cv5g2zg3thd12a4z90du4946n5ai4c9p',	'eyJ1c2VyIjoiMTIzNCIsInN0YXRlIjoiUHVuamFiIiwibG9nZ2VkSW4iOnRydWV9:1nMUH3:No5x93puvYwsnZ1N8jjOMdovePgleYfwRqg_Oxhz7yo',	'2022-03-08 17:58:09.262989+05:30'),
('wquy7pf6wrh7v66u64o79spmc89twxo7',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nTdoE:ZgKkTKxirMOvVC7YxwSzT4Mf1j3PBsPy2a1tJZWrhcE',	'2022-03-28 11:33:58.188524+05:30'),
('a8r3ch4syizu31y0ezsmpsqlrum0t4jg',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1ncLST:kT-GRYojeJgoQ8J7V-hkNZOrwsgGHGK_42GGbHYwWJk',	'2022-04-21 11:47:29.781171+05:30'),
('zkjqjth4ult48x621o5fl105uk7sp4qu',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1ncfu7:VqQpuBs_xdgLkTh8F7FoQZZ2oTUlcTYWMM7uTx7xE5k',	'2022-04-22 09:37:23.049311+05:30'),
('hxg7oif7mqs57ic1u1pxjejgyn4q1kyk',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nN55Y:1HyTaIAmo0VvxSP7hTbdrhr22F8kqVK-dvlEpKmYZKo',	'2022-03-10 09:16:44.302382+05:30'),
('u8hfozusmiu9bop7o5bqub2qwf2vr4le',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nNT4V:oA01lUNMCW4FoJNbjaGkOTX7kInUtxjt3LMRLuzB7xA',	'2022-03-11 10:53:15.100425+05:30'),
('7khw16p1kpktkqcym7ilkvabkp4kyb33',	'e30:1nU3i5:m2xeXjjpgA_BvyPtvmYCQxnZdhqE_NRmD3jeo9NKQJI',	'2022-03-29 15:13:21.987102+05:30'),
('8sav2khlnrcutzsf0ao4trkmcxza6135',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nNTB2:aLRrY2w2gBEt9RRTQbtoeB5fNTSi8kXr0ECrscB4Eak',	'2022-03-11 11:00:00.264958+05:30'),
('ebeq0vi2equkzk3y61janceigmfels3v',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nPK9E:iRKZA4B3tas3eTNQsqtWj3dwvcWVfXyxDuejcagqIzE',	'2022-03-16 13:45:48.640544+05:30'),
('pbpk8imdu8gshii0a21knkrby2b4ga7f',	'e30:1nHr9x:aSSpQdpdpPKjcxgnfFFaZlFHrdMojMr4SOfZDoJzDko',	'2022-02-23 23:23:41.173474+05:30'),
('rl5uk80ogn2a3v6alt1d6rbynbmx2iy2',	'e30:1nIJlN:UMBAyDGbLua2KxQzbAkD2ezITdDYJoznRnMQLF0o7ZI',	'2022-02-25 05:56:13.625033+05:30'),
('bg3ckkt1x1bjw693y2vng4r6ly86d8v1',	'e30:1nIRcc:1uA8khlhva5NRy-B3vhnEGTluCzfHkKT7ACHTmqagWM',	'2022-02-25 14:19:42.35865+05:30'),
('15zuxxjxh0h1yl3t1x6x6vdawpetwdkq',	'eyJ1c2VyIjoiMTIzNCIsInN0YXRlIjoiUHVuamFiIiwibG9nZ2VkSW4iOnRydWV9:1nSH2Z:PKbyJpZtw61H5UsiZ9zn-w6ruoBgmnLeM9siv8zFnJE',	'2022-03-24 17:03:07.495929+05:30'),
('41cqgw3aulxc7c213skuk85ur1y75j1s',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nJVay:4yIIoIv5CHh7KCRQdx36fFe346QEavshnrurVXiMUFM',	'2022-02-28 12:46:24.388541+05:30'),
('9nqs9bwv2fe6cziuxxovvbk895pxjd4i',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nJVay:4yIIoIv5CHh7KCRQdx36fFe346QEavshnrurVXiMUFM',	'2022-02-28 12:46:24.389871+05:30'),
('y1s59ra9h2mlj4af107h3kx1crzllryp',	'.eJwtjkEKwjAQRe8y6y780arJDTyDlBJwLMXahqRdiPTuhvlu3sAw7zFf2YpmCfKKOc7eSyPTMgz6uM0S1rxpYwfrJ6mEZ5xKXSTN77GUcaknd0k9qpR6ZzwaT8bWeDZejFejN-LAQRvUQR8MgAUwATbACFhxrLj_D066_QfI1zmo:1nV6I1:1tbXkcAoRrT6PoshpCG_-EDOOAz3AGeXZzQSubp_bng',	'2022-04-01 12:10:45.507053+05:30'),
('hv1x7kowchtksidyi9kbjsul7lap0wqf',	'.eJw1jkkKwzAMRa9StG4gcoe0uUEu0E0pwRARDLVjbGcRSu9eo99sntDwH_rQmiVRTw8X7EZHbYP1Ukfe5iKpsZN3oW7eyzzLNATqS1oFl2WLsvdRknc5u6VePCmOXDNxNMqT8qy8KK_KTnlT3pXcoiDNiDPyDAHDwFAwHAwJw2JgMf8fzIFe3x81QkIV:1nWGlM:mHgHc9NrFgJk6tixRDemRL2Zvf3I4gEy14n2gqAg7hA',	'2022-04-04 17:33:52.802973+05:30'),
('108l46zciycpnu6tbl40zol0ffgxnols',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nJqyD:EEgut7STiPCF2ywD4cNe80CHzBsaxpEn7TUJBUUmPXA',	'2022-03-01 11:35:49.809403+05:30'),
('2bhs96k27nrehkkjp4tbe8wxsx4kjzks',	'e30:1nJsCG:NKsHuTyHKar5F21oWSq0zAmwR9sqf1MIaJFaFjZMj1o',	'2022-03-01 12:54:24.878046+05:30'),
('qd2t4e1gu4nm61jqswy113am9kewlqqh',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nSYJO:T25iZhsE60oyxVBzlkdAgDt4RuqWOTkXaf_IU8vjFHg',	'2022-03-25 11:29:38.530466+05:30'),
('ey8ozupjanb12er8ucb1o0m5qg91lqwt',	'eyJ1c2VyIjoiMTIzNDUiLCJzdGF0ZSI6IkFzc2FtIiwibG9nZ2VkSW4iOnRydWV9:1nKerF:ELQ1Zd3Vt-EUqS-eQKVQUrOuxr2bupoqgaSgzFsHrOQ',	'2022-03-03 16:51:57.3214+05:30'),
('i6c40vuogk8zkcuk4sjdcu4vmu0ywjqk',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nKftg:taZdxpU5WR2PGnW0LrTxAx9d4SSnbnGh3W-nHu6nm5k',	'2022-03-03 17:58:32.343034+05:30'),
('r5tj9pz3fqa9jklu7jo0w489l6rz0t33',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nSYxz:EKkg3dfCbPAO0CX4ihuOoK0fpRH40t-qIHqrfQjRM1A',	'2022-03-25 12:11:35.391969+05:30'),
('uremw1pzs0nyjatkaw2lrfukfrjs4wd7',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nSekq:5jhQimcONnDsjph8ZtAMQ1WS9evOkeHJzu_pk1kGQkI',	'2022-03-25 18:22:24.772714+05:30'),
('1i5k936rczqeyrv1la1vw4rmkiiw8aoh',	'e30:1nKhlx:zEnBb0U2hsnQU4I1XURMtsxTEm3S1rqxq6hiMbY9rmc',	'2022-03-03 19:58:41.056872+05:30'),
('dxlenh1oyvh979ot4kcqhvjb7pdfxvpx',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nSsgT:kQvEZ9uZ3vIROefZbmrNi-My4g3umuMnu9CP2YWAQAc',	'2022-03-26 09:14:49.463854+05:30'),
('xfrx3ar2k5lwwi42hwjdyu8t2qbuwtm0',	'eyJ1c2VyIjoiOTk5MzUiLCJzdGF0ZSI6IkFuZGhyYSBQcmFkZXNoIiwibG9nZ2VkSW4iOnRydWV9:1nL0Os:nuKAp_mZgYTBYpkufH5eGOppxJVQbNdV4el3t41g_-E',	'2022-03-04 15:52:06.717503+05:30'),
('it5ejzjbclpkklgt2xxsmubyyajaydiu',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nL0UZ:dihCd5VYcrVI6DK-H3YRJrgbLRGKrtgS0PuAOf7zFic',	'2022-03-04 15:57:59.303881+05:30'),
('6z75abil71kzy7xjaitjevaubn0vwzxf',	'eyJ1c2VyIjoiYWRtaW4iLCJsb2dnZWRJbiI6dHJ1ZX0:1nL0VN:1UyU01cDaszCCKD5UgOO7V3Vb2LN9ds4vKmD7LH_5QI',	'2022-03-04 15:58:49.813546+05:30'),
('3p5cl6fjd0y9d5lbino23i5pn077v0zz',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nTcCF:YOO5pHDn9I6taqy4bdWmMTt9ZubuVouA0Kty8kGSWF4',	'2022-03-28 09:50:39.421346+05:30'),
('r5yef84aq713pak33vj3nok3aos1a9s8',	'e30:1nTdK9:pl9ELm5h84xWnKjEQKvBCMkfE0h50l7U8tagOB7D79c',	'2022-03-28 11:02:53.350935+05:30'),
('214fmber4dfbeg8ajhh3c2pavtbjlaew',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nTdW9:skEBXfWl5kzIevmETGoM5H325TQN8iimMY1JP9aSUIc',	'2022-03-28 11:15:17.729147+05:30'),
('pm3zxrw06afl1b9sleycwrqeagd8ht0n',	'eyJsb2dnZWRJbiI6dHJ1ZSwidXNlcmlkIjoxLCJ1c2VyIjoiMTIzNCIsInN0YXRlIjoiUHVuamFiIn0:1nbizg:vVLEqUEcQfaBqq6PWyNmr06tE-Z2qSvxhvnAx6jEgKs',	'2022-04-19 18:43:12.021635+05:30'),
('l0lt5sunmwtlopsnn6jv4qd3gmydp0ta',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nU3yG:F0boUB2NDPVdQpGrWJo8Gk0ZBZofRM09zwm-jgLrayQ',	'2022-03-29 15:30:04.036533+05:30'),
('dl63jvryb4l70lnek8c5fx0i0l9yarmv',	'.eJwtjkEKwjAQRe8y6y780arJDTyDlBJwLMXahqRdiPTuhvlu3sAw7zFf2YpmCfKKOc7eSyPTMgz6uM0S1rxpYwfrJ6mEZ5xKXSTN77GUcaknd0k9qpR6ZzwaT8bWeDZejFejN-LAQRvUQR8MgAUwATbACFhxrLj_D066_QfI1zmo:1nVC85:gsX4RJoR_uxnDV0ieH3Q4g4lRLCXKmPtGAFSppkvXSs',	'2022-04-01 18:24:53.638493+05:30'),
('ftje2msfecwal6g62lupoxh6wf1vejhk',	'.eJwtjkEKwjAQRe8y6y780arJDTyDlBJwLMXahqRdiPTuhvlu3sAw7zFf2YpmCfKKOc7eSyPTMgz6uM0S1rxpYwfrJ6mEZ5xKXSTN77GUcaknd0k9qpR6ZzwaT8bWeDZejFejN-LAQRvUQR8MgAUwATbACFhxrLj_D066_QfI1zmo:1nVEHv:hyxoPhxR-Opczta1eXG0qvCFxKrBelFCljI52o-RSeY',	'2022-04-01 20:43:11.448956+05:30'),
('ifiby6d9oclujmlt2gx7kgcth5keuou3',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nWCUq:pPE8ONQrX7i4WxiMEySioIR97bdbqutw_7ursXbwiEE',	'2022-04-04 13:00:32.78527+05:30'),
('b0waj533oosksog46v23wmqdgqc8frxq',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nWCc7:RmKaiMP4SDEvImaeN5btfpFcLdADYX-0rKL2EtjoXB8',	'2022-04-04 13:08:03.785502+05:30'),
('84l5lqzi0tynq5uyzp8o9p2r3dn30tui',	'.eJwtjkEKwjAQRe8y6y780arJDTyDlBJwLMXahqRdiPTuhvlu3sAw7zFf2YpmCfKKOc7eSyPTMgz6uM0S1rxpYwfrJ6mEZ5xKXSTN77GUcaknd0k9qpR6ZzwaT8bWeDZejFejN-LAQRvUQR8MgAUwATbACFhxrLj_D066_QfI1zmo:1nZovq:nCbG8HfudD8dSs4jUdlFUA1jhkRUOgLykiGetecfOHA',	'2022-04-14 12:39:22.064238+05:30'),
('z35akngd5k6p5ar1vkizse5bcd58ivvj',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nWrXj:jIdTWoiO5nTEwOOtJA0EeHAqfVsV5dikL7eunMUWVcA',	'2022-04-06 08:50:15.523781+05:30'),
('miw5xlzqajl1xktxh2oshbyb92jltn3m',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nWrjZ:NGsck7AcmSGgKyeBtwCHIYcd6ijtxoeOwraBDl_qyNw',	'2022-04-06 09:02:29.690739+05:30'),
('ak8fj0st9mzsas8vu41qu2zzgt19fm1h',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nX2Q7:1XVTtMaVoJmPE-LvZe-Df8myu0OGxog2gDpJ-bDc2So',	'2022-04-06 20:27:07.269949+05:30'),
('6wr23dkjn2czr0kzeqz3xa2ivhhu5tte',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nXDHG:5Cyz2-Cc0pf_94gOQUoVAkB0fy-NSlUA1OUpRMz9WeU',	'2022-04-07 08:02:42.665288+05:30'),
('n079awy1lbfucmiuc7pqrw1ezq7drs2m',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nXDIB:1oeizgYCfzg3ggrK5dLV8hR2s9T-mjVJOQg_jjxHX40',	'2022-04-07 08:03:39.721331+05:30'),
('hjpmah9cg1p8xm9zp9icvsf79a84441l',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nXH4q:ORw0z42l-ffW9NJnT5iaOFV3SlqLzcIXM4aSno4m41g',	'2022-04-07 12:06:08.05269+05:30'),
('m391dto0u8t1lmkfgjr6o0fj8tip67vy',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1ncUvr:h9m_chHREOFNW528vI8qB6XjpXhKsLs9_4YF-1CF3hE',	'2022-04-21 21:54:27.289+05:30'),
('2zzze6wdgtjv9ybjqrjq01egf3nzd0nu',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1ncftB:QRMWB_74_PaEopjaxp3mwjWlJT1UwFypnHJVnaQd90I',	'2022-04-22 09:36:25.861981+05:30'),
('04he6g3twhz0nlgt8l84oi4xcffp9ntn',	'e30:1ncmpw:faronJLMXxxqtpV4cgF0syW5xwOw5SlqbwtwreZIx00',	'2022-04-22 17:01:32.967112+05:30'),
('wj8dc7nno9080a0j7azluu3ymuoj7cwi',	'e30:1nd6HI:H5hMFZU-wdm3W24vnB56L9oyilB2rQJKaVrZnocTP7g',	'2022-04-23 13:47:04.427334+05:30'),
('wmhqdh5aa2swgyuiwfekp87zcardwrvv',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1nfElK:4sI5O2voekRfOZpRcBqXbZM9FjlmaZq1UzR9xkaTpuw',	'2022-04-29 11:14:54.453704+05:30'),
('psha0tgshy2fmd28na3t0inzcfbc7n11',	'.eJw1jkkKwzAMRa9StG4gcoe0uUEu0E0pwRARDLVjbGcRSu9eo99sntDwH_rQmiVRTw8X7EZHbYP1Ukfe5iKpsZN3oW7eyzzLNATqS1oFl2WLsvdRknc5u6VePCmOXDNxNMqT8qy8KK_KTnlT3pXcoiDNiDPyDAHDwFAwHAwJw2JgMf8fzIFe3x81QkIV:1nfFKh:NIlsdEccdmClKFdR_X3Oj3IZweLbybVvIvwo7N-TIGU',	'2022-04-29 11:51:27.572356+05:30'),
('9arbm0kbum9qr6k8lkm35zawsymrxiuk',	'.eJwtjs0KwjAQhN9lzx6c-Ju-gfgIRUrAWIptGpL2IOK7u-54-UKGmY99y1pjkUauoYQkG_umMEWNnr_Iew3Hue_j_ZKkWcoaWVpeWUuPMFYNcizTUOswa6WV3EFHuXPGnXFvPBiPxpPxbPRGbPlwDc7BPSgADaACdIAS0OJocf8bnNw-XyrCP-M:1nfZVa:NixnUaAKoEbFBK-Q8cwE7s6eSfaXlAklAJ21Yz5LqXA',	'2022-04-30 09:24:02.043227+05:30'),
('678tc4k9c72u7x9ppm21l9anol78eohg',	'.eJw1jkkKwzAMRa9StG4gcoe0uUEu0E0pwRARDLVjbGcRSu9eo99sntDwH_rQmiVRTw8X7EZHbYP1Ukfe5iKpsZN3oW7eyzzLNATqS1oFl2WLsvdRknc5u6VePCmOXDNxNMqT8qy8KK_KTnlT3pXcoiDNiDPyDAHDwFAwHAwJw2JgMf8fzIFe3x81QkIV:1nfZWI:FZhHbdBrmJheVZ-cHI7SjgpSUiD-vSf16xxa_blrne4',	'2022-04-30 09:24:46.676464+05:30'),
('eq1an5nsvjyhnvedyd7nhizn40hj653d',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1ngImo:2IeEOHAwvksZ4ud2XPjvjNXzRm5efYTJMSFf0qd2pA4',	'2022-05-02 09:44:50.629413+05:30'),
('jlari2fmgapkuyq9o888oq8t5c92fzox',	'.eJwtjkEKwjAQRe8y6y780arJDTyDlBJwLMXahqRdiPTuhvlu3sAw7zFf2YpmCfKKOc7eSyPTMgz6uM0S1rxpYwfrJ6mEZ5xKXSTN77GUcaknd0k9qpR6ZzwaT8bWeDZejFejN-LAQRvUQR8MgAUwATbACFhxrLj_D066_QfI1zmo:1nbG4d:NnzGpxxD5luXJAGmX0zCDmD4cv3TWzBUh5DJdGrjOdQ',	'2022-04-18 11:50:23.859916+05:30'),
('t8yr2vn00j6utkos6afixju2snrwg1fn',	'eyJsb2dnZWRJbiI6ZmFsc2UsInVzZXJpZCI6MX0:1nhqSZ:Cau9_dNCabuv8vlrxZZQGNJScpabKFb7IUwDyseUXU4',	'2022-05-06 15:54:19.377738+05:30'),
('8byw8cempj5pwgc8ily6di4xvovyatea',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1ngrXC:xBQlwVEmEcwBT79SKt1TF9SnRM3ZP7_X9oCZd10gLoI',	'2022-05-03 22:51:02.42569+05:30'),
('bnsrma0aspb8x1agvk9vyxfv6z35e59q',	'.eJw1jkkKwzAMRa9StG4gcoe0uUEu0E0pwRARDLVjbGcRSu9eo99sntDwH_rQmiVRTw8X7EZHbYP1Ukfe5iKpsZN3oW7eyzzLNATqS1oFl2WLsvdRknc5u6VePCmOXDNxNMqT8qy8KK_KTnlT3pXcoiDNiDPyDAHDwFAwHAwJw2JgMf8fzIFe3x81QkIV:1nixFF:SSQJA5_cCYycPIfMcyKQVuKpDNyJ_Oz6lhiJr2g6S_Y',	'2022-05-09 17:21:09.801925+05:30'),
('ncjon36bkdk8rff96vg5nom3o1xj72mr',	'.eJwtjksKwzAMBe-idRZ9Tn_xDXqGEkIgajDkY-xkEULvXqPXzRgkz6BT9qxJvPTDHBapZFrHUYfXIn5Lu1a23o6o4j_9lMsgappDzmEtX94SOxQpds5YG6_Gm_FufBifxsaICx_aoA76YAAsgAmwAUbAimPF_W9w0n5_ZFU5Mg:1nZUjU:MKy9yOOdhPcnQjEFSxfWyd41hVXWVG1nbf6AISOpIXc',	'2022-04-13 15:05:16.807143+05:30'),
('fv4iaa7o1jibsotx3aghl8prueqcwo3d',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1ngrXz:XAcvhG69G_oVtjDWVJYW-H05Z5wxnMi1sxz1lbBMOfI',	'2022-05-03 22:51:51.33186+05:30'),
('swlh263nlznn4prww0ntiih6dqkqu9va',	'eyJsb2dnZWRJbiI6dHJ1ZSwidXNlciI6IjEyMzQiLCJzdGF0ZSI6IlB1bmphYiIsInVzZXJpZCI6MX0:1nhQHk:GIylyHvMXq7Gndv4ath7Tc3L84ZB9Cpt4QtjuLdtg24',	'2022-05-05 11:57:24.953364+05:30'),
('4zjz4ume0995aay1l6s7adzk3ea7gv12',	'.eJw1jkkKwzAMRa9StG4gcoe0uUEu0E0pwRARDLVjbGcRSu9eo99sntDwH_rQmiVRTw8X7EZHbYP1Ukfe5iKpsZN3oW7eyzzLNATqS1oFl2WLsvdRknc5u6VePCmOXDNxNMqT8qy8KK_KTnlT3pXcoiDNiDPyDAHDwFAwHAwJw2JgMf8fzIFe3x81QkIV:1nhQWP:BWFUMm7IYvh7929iMDsg_kn6FayAjiWiG1bNH-3mPu0',	'2022-05-05 12:12:33.809195+05:30'),
('whkk8jxr6uggz3c2ys7xnv1bcrosfvgj',	'.eJwtjs0KwjAQhN9lzx6c-Ju-gfgIRUrAWIptGpL2IOK7u-54-UKGmY99y1pjkUauoYQkG_umMEWNnr_Iew3Hue_j_ZKkWcoaWVpeWUuPMFYNcizTUOswa6WV3EFHuXPGnXFvPBiPxpPxbPRGbPlwDc7BPSgADaACdIAS0OJocf8bnNw-XyrCP-M:1nhQae:YDYjU-FhmL_8iIPk5H1sA5i96054A7yH_dF6ulfPNdo',	'2022-05-05 12:16:56.869701+05:30'),
('y3nulgzd2cpxh7madqwekue1anrni5u5',	'.eJyrVsrJT09PTfHMU7IqKSpN1VEqLU4tykxRsjKEMJWslAzhQElHqbgksSQVKBhQmpeVmKRUCwCm6BPN:1nhqJ1:stn5BlA9RNGJTJXxw_MBCK97PD30SsjTZyhvrXLbilY',	'2022-05-06 15:44:27.038506+05:30'),
('75kplz49dy53h5zyb7oqd0yskxfnebnz',	'.eJxNjksKwzAMRO-idRcd958b9AylBEPUYIgdYyeLUHr3Gk0X3TwhMfPQW9aqRTrxQwxJdrYmH_XvNM3jqMM9SbeUVRlZttwiLz_VdshaYqg1zC3ykNyjlXLvjAfj0Xgyno0X49V4M2LPwTZYB_ugADSACtABSkCLo8X9fnDy_HwB0Z4_iQ:1nm7EX:3xdhnMV6ZQhQMUc8XLGo1_WkfeX15uSgP8kPyTA2FDk',	'2022-05-18 10:37:29.906891+05:30');


DROP TABLE IF EXISTS "field_preparation";
DROP SEQUENCE IF EXISTS field_preparation_id_seq;
CREATE SEQUENCE field_preparation_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."field_preparation" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "type" character varying NOT NULL,
    "procedure" character varying,
    "schedule" character varying NOT NULL,
    "id" integer DEFAULT nextval('field_preparation_id_seq') NOT NULL,
    CONSTRAINT "field_preparation_pkey" PRIMARY KEY ("state", "crop_id", "type", "schedule"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "field_preparation" ("crop_id", "state", "type", "procedure", "schedule", "id") VALUES
(9,	'Punjab',	'Seedling Treatment',	'Smear the seeds with talc formulation of Trichoderma harzianum @ 15 g per kg of seed immediately before sowing and seedling root dip for 6 hrs with T. harzianum @ 15 g per litre of water before transplanting.',	'May - June',	7),
(9,	'Punjab',	'Transplanting',	'Irrigate the nursery before uprooting and wash them to remove mud. Transplant two seedlings per hill in lines at 20 x 15 cm (33 hills/sq. metre) during the optimum period in a well puddled field. In the late transplanted crop, the spacing may be reduced to 15x15 cm (44 hills/sq. metre) to minimize the reduction in yield.',	'First fortnight of July, Second fortnight of July',	8),
(9,	'Punjab',	'Transplanting-Land Preparation',	'Mix 12 to 15 tonnes of well- rotten farmyard manure or compost per acre in the soil. Irrigate the field to permit the germination of weeds. Plough the field twice after about a week to kill germinated weeds.
Spread the treated seeds in 7-8 cm thick layer over wet gunny bags and cover them with wet gunny bags. Keep the layer of seeds moist by sprinkling water on it periodically. The seeds sprout in about 24 to 36 hours.',	'May - June',	9),
(8,	'Punjab',	'Laser Levelling',	'Plough the field twice with disc harrow followed by cultivation with cultivator and planking, then level the field with laser leveller. After laser levelling, irrigate the field followed by cultivation with cultivator and planking.',	'Before Sowing',	10),
(10,	'Punjab',	'Land Preparation',	'Give four to five ploughings and plankings to make the seed-bed free from clods and weeds. Use mould-board plough, disc-harrow or cultivator for the first cultivation. Level the field to ensure proper irrigation and drainage. Maize can also be sown without any preparatory tillage with zero till drill.',	'Before Sowing',	11),
(17,	'Punjab',	'After paddy-Paddy straw retained',	'When paddy is harvested with combine, the left over straw can be managed using following techniques:
The left over straw can also be chopped by using paddy straw chopper cum spreader into small pieces and the chopped straw can be mixed into the soil by tillage operations without any adverse effect on yield of wheat.
Wheat can also be sown in the combine harvested fields with Happy Seeder/Super Seeder/PAU Smart Seeder in the standing paddy stubbles.',	'Before Sowing',	12),
(17,	'Punjab',	'After paddy- Paddy straw removed',	'The left over straw can be cut by using stubble shaver and collected after 2 to 3 days (sun drying) by using straw baler. Straw baler collects the straw and compresses it in the form of bales. In such fields and in manual harvested paddy fields, if the field has enough soil moisture, undertake tillage straightway, otherwise apply pre sowing irrigation (rauni). Use disc harrow once, followed by planking. Give another cultivation/ploughing with a cultivator. If the soil is heavy, give one more cultivation before planking the soil. Tractor drawn cultivator with pulverizing roller-cum-puddler can also be used for preparing the dry seed bed.',	'Before Sowing',	13),
(8,	'Maharashtra',	'Laser Levelling',	'Plough the field twice with disc harrow followed by cultivation with cultivator and planking, then level the field with laser leveller. After laser levelling, irrigate the field followed by cultivation with cultivator and planking.',	'May-Jun',	14),
(8,	'Maharashtra',	'Nursery Raising: For Conventional Transplanting',	'Plough the field twice after about a week to kill germinated weeds. Spread the treated seeds in 7-8 cm thick layer over wet gunny bags and cover them with wet gunny bags. Keep the layer of seeds moist by sprinkling water on it periodically. The seeds sprout in about 24 to 36 hours.',	'May-Jun',	15),
(17,	'Maharashtra',	'After paddy- Paddy straw removed',	'It requires a well pulverized but compact seed-bed for good and uniform germination. After harvest of previous crop, the field should be ploughed with disc or mould board plough. Take one deep ploughing followed by two or three harrowing with disc harrow and 2-3 planking should be given to prepare a well pulverized seed bed.For good germination, apply pre-sowing irrigation 7-10days before sowing. Carried out ploughing in evening time and kept furrow open whole night to absorb some moisture from dew. Planking should be done after each ploughing early in the morning. In rain-fed areas, to protect crop from termite attacked, treat seeds with Chlorpyriphos 20EC@700ml per 100 kg of seed by mixing in 5 litres of water. After then dry seeds in shade.',	'Before Sowing',	16),
(8,	'Meghalaya',	'Levelling',	'Prepare the field thoroughly by three to four ploughing. Irrigate, puddle and level it. 
Good levelling is necessary for efficient water management to encourage quick establishment and profused tillering.',	'Before Sowing',	18),
(8,	'Meghalaya',	'Transplanting',	'Irrigate the nursery beds to facilitate easy uprooting of seedlings. Clip off the leaf tips before transplanting. Transplant the seedlings @ 3 to 4 seedlings per hill at 5 to 6cms depth at a spacing of 20 x 10cms (20cms between rows and 10cms between hills in each row).',	'Transplant within 20-25 days in low altitude, 25-30 days in mid altitude and 50-55 days in high altitude areas.',	19),
(8,	'Madhya Pradesh',	'Levelling',	'Prepare the field thoroughly by three to four ploughing. Irrigate, puddle and level it. Good levelling is necessary for efficient water management to encourage quick establishment and profused tillering.',	'Before Sowing',	20),
(8,	'Madhya Pradesh',	'Nursery Raising For Transplanting',	'Plough the field twice after about a week to kill germinated weeds. Spread the treated seeds in 7-8 cm thick layer over wet gunny bags and cover them with wet gunny bags. Keep the layer of seeds moist by sprinkling water on it periodically. The seeds sprout in about 24 to 36 hours.',	'Before Sowing',	22),
(8,	'Madhya Pradesh',	'Nursery Transplanting',	'Prepare raised beds of 7.5 m length, 2.0 m width and 10 cm height. For one Acre area nearly about
20 beds are required',	'Before Sowing',	21),
(17,	'Madhya Pradesh',	'After  Harverst previous Crop',	'It requires a well pulverized but compact seed-bed for good and uniform germination. After harvest of previous crop, the field should be ploughed with disc or mould board plough. Take one deep ploughing followed by two or three harrowing with disc harrow and 2-3 planking should be given to prepare a well pulverized seed bed.For good germination, apply pre-sowing irrigation 7-10days before sowing. Carried out ploughing in evening time and kept furrow open whole night to absorb some moisture from dew. Planking should be done after each ploughing early in the morning',	'Before Sowing',	23),
(8,	'Punjab',	'Nursery Raising: For Conventional Transplanting',	'Mix 12 to 15 tonnes of well- rotten farmyard manure or compost per acre in the soil. Irrigate the field to permit the germination of weeds. Plough the field twice after about a week to kill germinated weeds.
Spread the treated seeds in 7-8 cm thick layer over wet gunny bags and cover them with wet gunny bags. Keep the layer of seeds moist by sprinkling water on it periodically. The seeds sprout in about 24 to 36 hours.',	'20 May- 5 June',	5),
(10,	'Maharashtra',	'Land Preparation',	'Cultivation selected land should be free from weeds and remains of previously grown crop. Plough the land to bring the soil to fine tilth. It may take 6 to 7 plough. Level the field to ensure proper irrigation and drainage. Maize can also be sown without any preparatory tillage with zero till drill.Mix P.S.B and Azotobactor@3kg in well decomposed cow dung@100-150kg and then spread in field before seed sowing.',	'Before Sowing',	24);



DROP TABLE IF EXISTS "notification_data";
DROP SEQUENCE IF EXISTS notification_data_id_seq;
CREATE SEQUENCE notification_data_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."notification_data" (
    "state" character varying,
    "notification_title" character varying,
    "notification_body" character varying,
    "days_gap_after_sowing_min" integer,
    "related_to_activity" character varying,
    "id" integer DEFAULT nextval('notification_data_id_seq') NOT NULL,
    "days_gap_after_sowing_max" integer,
    "cropid" integer,
    CONSTRAINT "notification_data_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "notification_data" ("state", "notification_title", "notification_body", "days_gap_after_sowing_min", "related_to_activity", "id", "days_gap_after_sowing_max", "cropid") VALUES
('Punjab',	'Seed Treatment - test',	'Test - Prior to sowing, soak the seed in water inside the bucket and then discard the floating seeds ,soak 1.5-2 kg seeds in 1kg salt per 10 liters of water. Use sprouted seeds for sowing. For this the seeds are soaked into treated water i.e. Bavistin 2g/kg seed or Saaf 3g/kg of seed. Spread the treated seeds in a 7-8 cm thick layer over wet gunny bags and cover them with wet gunny bags. Keep the layer of seeds moist by sprinkling water on it periodically. The seeds sprout in about 24 to 36 hours. The sprout length should not be more than 7-8 mm.',	-3,	'Seed Treatment',	1,	-3,	8),
('Punjab',	'Seed Bed Preparation - test',	'Test - A nursery area of 300-400 m2 is enough to produce seedlings for transplanting 1 acre of land. To prepare seed bed one must plough the field properly after the harvest of Rabi crop.',	-2,	'Field Preparation',	2,	-2,	8),
('Punjab',	'Seed Sowing - test',	'Test - Water level is maintained  at 2-3 cm depth and Sprouted seeds are broadcast  uniformly on the prepare seed bed area. Apply 4 kg DAP and 1 kg Zinc.',	0,	'Sowing',	3,	0,	8),
('Punjab',	'Apply fertilizer - test',	'Test - Apply 2.8 kg Urea after 13-15 days of sowing. If Iron deficiency is observed, apply 0.5% Ferrous sulfate.',	13,	'Fertilizer',	4,	15,	8),
('Punjab',	'Transplanting - test',	'Test - The 25 days old  Seedling (4-5 leaf stage ) unrooted from nursery-beds need to be transplanted to 3 to 4 cm deep.',	25,	'Transplant',	5,	25,	8),
('Punjab',	'Harvesting - test',	'Test - Harvesting should be undertaken as soon as rice grains mature, notwithstanding the stalks remaining still green, to avoid grain shattering and development of sun-cracks. In early- and medium-duration varieties 25-30 days after flowering and 35-40 days after in late varieties are considered the proper stage for harvesting.',	150,	'Harvesting',	6,	175,	8);

DROP TABLE IF EXISTS "nutrient_deficiency";
DROP SEQUENCE IF EXISTS nutrient_deficiency_id_seq;
CREATE SEQUENCE nutrient_deficiency_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."nutrient_deficiency" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('nutrient_deficiency_id_seq') NOT NULL,
    CONSTRAINT "nutrient_deficiency_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "nutrient_deficiency" ("crop_id", "state", "name", "symptoms", "measures", "id") VALUES
(8,	'Punjab',	'Iron Deficiency',	'Chlorosis among seedlings appears in the youngest leaf about three weeks after transplanting. Plants die and often the crop fails completely.',	'Give copious irrigations as soon as chlorosis appears and give 2 or 3 sprays of one per cent ferrous sulphate solution at weekly intervals (1 kg of ferrous sulphate in 100 litres of water per acre).',	14),
(8,	'Punjab',	'Zinc Deficiency',	'The symptoms of zinc deficiency appear 2-3 weeks after transplanting.
The lower leaves become rusty brown near the base and ultimately dry up. 
The symptoms of zinc deficiency sometimes appear in patches even after the application of the recommended dose of zinc sulphate.',	'In case previous crop in this field had shown the symptoms of zinc deficiency, apply 25 kg of zinc sulphate heptahydrate (21%) or 16 kg zinc sulphate monohydrate (33%) per acre at puddling
In case, the deficiency is noticed in the growing crop, apply this quantity of zinc sulphate as soon as possible.
Sometimes zinc deficiency appear in patches, broadcast 10 kg of zinc sulphate heptahydrate or 6.5 kg zinc sulphate monohydrate per acre mixed with an equal quantity of dry soil on the affected patches.',	10),
(9,	'Punjab',	'Iron Deficiency',	'Chlorosis among seedlings appears in the youngest leaf about three weeks after transplanting. Plants die and often the crop fails completely',	'Give copious irrigations as soon as chlorosis appears and give 2 or 3 sprays of one per cent ferrous sulphate solution at weekly intervals (1 kg of ferrous sulphate in 100 litres of water per acre).',	16),
(9,	'Punjab',	'Zinc Deficiency',	'The symptoms of zinc deficiency appear 2-3 weeks after transplanting. The lower leaves become rusty brown near the base and ultimately dry up. The symptoms sometimes appear in patches even after the application of the recommended dose of zinc sulphate.',	'In case previous crop in this field had shown the symptoms of zinc deficiency, apply 25 kg of zinc sulphate heptahydrate (21%) or 16 kg zinc sulphate monohydrate (33%) per acre at puddling.
In case, the deficiency is noticed in the growing crop, apply this quantity of zinc sulphate as soon as possible.
Sometimes zinc deficiency appear in patches, broadcast 10 kg of zinc sulphate heptahydrate or 6.5 kg zinc sulphate monohydrate per acre mixed with an equal quantity of dry soil on the affected patches.',	15),
(10,	'Punjab',	'Zinc Deficiency',	'The deficiency symptoms appear within 2 weeks of seedling emergence.
 A broad band of white or very light-yellow tissue, with reddish veins appears, on each side of the midrib, beginning at the base of the second or third leaf from the top of the plant. 
The white patch later extends in stripes towards the tip parallel to the midrib. The midrib and the leaf margin remain green. The plants remain stunted and have short inter-nodes.
In the case of mild deficiency there is a white stripe in the upper leaves. The mild deficiency disappears by the mid-season, but the silking and tasseling are delayed.',	'Broadcast 10 kg of zinc sulphate heptahydrate (21%) or 6.5 kg zinc sulphate monohydrate (33%) per acre at sowing mixed with an equal quantity of dry soil, along rows, hoe it into the soil and then irrigate the field. In standing crop, apply 10 kg of zinc sulphate heptahydrate (21%) or 6.5 kg zinc sulphate monohydrate (33%) mixed with an equal quantity of dry soil along rows, hoe it into the soil and then irrigate the field.
When the symptoms are observed late in the season and interculture is not possible, spray zinc sulphate-lime mixture prepared by mixing 1.2 kg of zinc sulphate heptahydrate (21%) and 0.6 kg of unslaked lime or 0.75 kg zinc sulphate monohydrate (33%) and 0.38 kg of unslaked lime with 200 litres of water to cover one acre. 

',	18),
(17,	'Punjab',	'Sulphur Deficiency',	'The symptoms first appear on the younger leaves with fading of the normal green colour. 
The topmost leaves become light yellow except for the tip, while the lower leaves retain green colour for a longer time.',	'Apply 100 kg of gypsum or 18 kg bentonite-sulphur (90%) per acre before sowing to meet the sulphur requirement of the wheat',	23),
(17,	'Punjab',	'Manganese Deficiency',	'The symptoms appear on the middle leaves as interveinal chlorosis with light greyish yellow to pinkish brown or buff coloured specks of variable size confined largely to 2/3 lower portion of the leaf. 
Later, the specks coalesce forming a streak or band in between the veins which remain green.',	'Give one spray of 0.5% manganese sulphate solution (1.0 kg manganese sulphate in 200 litres of water), 2-4 days before first irrigation and three sprays afterwards at weekly intervals on sunny days.',	21),
(17,	'Punjab',	'Zinc Deficiency',	'Symptoms are stunted and bushy crop with leaves chlorotic in the middle, which later break and keep hanging.',	'Apply 25 kg of zinc sulphate (21%) per acre which will be enough for 2-3 years. 
Zinc deficiency can also be corrected by foliar spray of 0.5% zinc sulphate (21% zinc). 
Prepare the solution for spray by dissolving 1kg zinc sulphate and 1/2 kg unslaked lime in 200 litres of water.',	22),
(8,	'Maharashtra',	'Zinc Deficiency',	'Zinc deficiency appear 2-3 weeks after transplanting. The lower leaves become rusty brown near the base and ultimately dry up. Or  sometimes appear in patches even after the application of the recommended dose of zinc sulphate.',	'apply 25 kg of zinc sulphate heptahydrate (21percentage ) or 16 kg zinc sulphate monohydrate (33Percetnage ) per acre at puddling. In case, the deficiency is noticed in the growing crop, apply this quantity of zinc sulphate as soon as possible',	24),
(17,	'Maharashtra',	'Iron Deficiency',	'Chlorosis among seedlings appears in the youngest leaf about three weeks after transplanting. Plants die and often the crop fails completely.',	'Give copious irrigations as soon as chlorosis appears and give 2 or 3 sprays of one per cent ferrous sulphate solution at weekly intervals (1 kg of ferrous sulphate in 100 litres of water per acre)',	25),
(8,	'Maharashtra',	'Iron Deficiency',	'Appears in the youngest leaf about three weeks after transplanting. Leaves become white in colour.',	'Give 2 or 3 sprays of one per cent ferrous sulphate solution at weekly intervals (1 kg of ferrous sulphate in 100 litres of water per acre).',	26),
(10,	'Maharashtra',	'Zinc Deficiency',	'Mostly observed in areas having use of high yielding variety. Broad band of white-yellow along with reddish veins are appeared on each side of mid rib on second or third leaf from top of plant.',	'apply Zinc Sulphate@10 kg/acre at time of sowing. If deficiency is observed in standing field, apply Zinc Sulphate and mixed with equal quantity of dry soils and apply along the rows.',	27);

DROP TABLE IF EXISTS "organic_manure";
DROP SEQUENCE IF EXISTS organic_manure_id_seq;
CREATE SEQUENCE organic_manure_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."organic_manure" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "trade_name" character varying NOT NULL,
    "cycle" character varying,
    "id" integer DEFAULT nextval('organic_manure_id_seq') NOT NULL,
    "amount" character varying,
    CONSTRAINT "organic_manure_pkey" PRIMARY KEY ("state", "crop_id", "trade_name")
) WITH (oids = false);

INSERT INTO "organic_manure" ("crop_id", "state", "trade_name", "cycle", "id", "amount") VALUES
(8,	'Punjab',	'Organic manures/Prali Char',	'Before transplanting of rice',	6,	'Dose (t/acre): Farmyard manure - 6, Pressmud - 6, Poultry manure - 2.5, Gobar gas slurry - 2.4, Prali Char - 2.0, Green manure , Summer moong crop residue incorporation'),
(9,	'Punjab',	'Green manure',	'Before transplanting of basamti rice',	7,	''),
(10,	'Punjab',	'Organic Manures',	'',	8,	'Green manure the field, to be put under maize with Dhaincha/ Sunhemp/Cowpea.  Cowpea/Dhaincha/Sunhemp should be sown during second fortnight of April using 12/20/20 kg seed per acre. The 50 days old green manure crop should be burried and allowed to decompose for about 10 days before sowing of maize.'),
(17,	'Punjab',	'Farmyard manure (FYM)',	'',	9,	'Apply good quality farmyard manure before sowing and reduce the fertilizer quantity by 2 kg of N and 1 kg of P per tonne of farmyard manure. Similarly, where wheat follows potato which received 10 tonnes of farmyard manure per acre, no phosphorus and only one-half of the recommended nitrogen dose i.e 25 kg N (55 kg urea per acre) need to be applied.'),
(17,	'Punjab',	'Rice husk ash/Bagasse ash',	'',	12,	'Apply 4 tonne per acre of rice husk ash or bagasse ash to wheat before last ploughing and reduce the dose of phosphorus to one- half i.e. 12 kg P2O5 (28 kg DAP or 75 kg SSP per acre).'),
(17,	'Punjab',	'Prali char',	'',	13,	'Apply 2 tonne per acre prali char to wheat and save 35 kg urea per acre.'),
(17,	'Punjab',	'Poultry manure/gobar gas plant slurry/ press mud',	'At time of sowing, at time of first and second irrigation',	14,	'Apply 37 kg N per acre i.e. 80 kg urea in two equal split doses (at first and second irrigation) and drill 75 kg single superphosphate/acre at sowing or apply 28 kg DAP.'),
(17,	'Maharashtra',	'Organic Manures',	'Before sowing',	15,	'It is desirable that  1 to 1.2 tonnes of farmyard manure per Acre or some other organic matter is applied 5 or 6 weeks before sowing.'),
(8,	'Madhya Pradesh',	'Organic Manures',	'Before sowing',	16,	'1,000 to 1,500 kg of well decomposed farm yard manure has to be incorporated 2-3 weeks before sowing.'),
(17,	'Madhya Pradesh',	'Green manure',	'Before sowing',	17,	'Apply 6-8 tonnes of decomposed cow dung manure in the field after every two years.');




DROP TABLE IF EXISTS "pest";
DROP SEQUENCE IF EXISTS pest_id_seq;
CREATE SEQUENCE pest_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."pest" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('pest_id_seq') NOT NULL,
    "pest_image" character varying(500),
    CONSTRAINT "pest_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "pest" ("crop_id", "state", "name", "symptoms", "measures", "id", "pest_image") VALUES
(8,	'Punjab',	'Rice stem borers',	'The larvae of these insects bore into the stem and cause damage from July to October. 
The affected young plants show dead-hearts (yellowing and drying of central shoot) whereas the old ones produce empty earheads which turn white and stand erect.',	'The fields showing more than 5% dead hearts (Economic Threshold Level, ETL) should be sprayed with 60 ml Coragen 18.5 SC (chlorantraniliprole*) or 20 ml Fame 480 SC (flubendiamide*) or 170 g of Mortar 75 SG (cartap hydrochloride) or 1 litre of Coroban/ Dursban/Lethal/Chlorguard/Durmet/Classic/ Force 20 EC (chlorpyriphos) or 80 ml neem based bio-pesticide, Ecotin (azadirachtin 5%) in 100 litres of water per acre. 
Further application of any of these insecticides may be repeated as and when damage reaches economic threshold level. 
Prefer Ecotin at pest initiation stage.',	9,	NULL),
(8,	'Punjab',	'Grasshoppers',	'The adults and nymphs of the grasshoppers eat the leaves especially in nursery.',	'Spray 94 ml Pexalon 10 SC (triflumezopyrim) or 80 g Osheen 20 SG (dinotefuran) or 120 g Chess 50 WG (pymetrozine) or 800 ml Ekalux/Quinguard/Quinalmass 25 EC (quinalphos) in 100 litres of water per acre. Repeat the spray if necessary. 
For better effectiveness, use knapsack sprayer while directing its spray towards the base of the plants. If the damage is noticed at hopper burn stage, treat the affected spots alongwith their 3-4 metre periphery immediately as these spots harbour high population of the insect.',	12,	NULL),
(8,	'Punjab',	'Rice hispa',	'The grubs of this pest tunnel into the leaves, whereas the adults are exposed feeders. The grubs cause damage by producing bold, white streaks on the leaves.',	'If the attack starts in nursery, clip-off and destroy the leaf tips of the affected seedlings before transplanting. 
On the transplanted crop, spray 800 ml Ekalux 25 EC (quinalphos) or 1.0 litre Dursban 20 EC (chlorpyriphos) in 100 litres of water per acre with a manually operated sprayer. Repeat the spraying if the attack persists.',	13,	NULL),
(8,	'Punjab',	'Rice-ear-cutting-caterpillar',	'The young larvae feed on leaves, leaving only the mid- ribs and stems. 
The old larvae cut off the panicles mostly at the base.',	'',	14,	NULL),
(8,	'Punjab',	'Rice root weevil',	'Its white, legless grubs feed on roots in the soil from July to September. 
The attacked plants turn yellow, stunted and produce only a few tillers.',	'',	15,	NULL),
(9,	'Punjab',	'Grasshoppers',	'The adults and nymphs of the grasshoppers eat the leaves especially in nursery.',	'Spray 94 ml Pexalon 10 SC (triflumezopyrim) or 80 g Osheen 20 SG (dinotefuran) or 120 g Chess 50 WG (pymetrozine) or 800 ml Ekalux/Quinguard/Quinalmass 25 EC (quinalphos) in 100 litres of water per acre. Repeat the spray if necessary. For better effectiveness, use knapsack sprayer while directing its spray towards the base of the plants. If the damage is noticed at hopper burn stage, treat the affected spots alongwith their 3-4 metre periphery immediately as these spots harbour high population of the insect.',	17,	NULL),
(9,	'Punjab',	'Rice hispa',	'The grubs of this pest tunnel into the leaves, whereas the adults are exposed feeders. The grubs cause damage by producing bold, white streaks on the leaves.',	'If the attack starts in nursery, clip-off and destroy the leaf tips of the affected seedlings before transplanting. On the transplanted crop, spray 800 ml Ekalux 25 EC (quinalphos) or 1.0 litre Dursban 20 EC (chlorpyriphos) in 100 litres of water per acre with a manually operated sprayer. Repeat the spraying if the attack persists.',	18,	NULL),
(10,	'Punjab',	'Armyworm and silk cutter',	'These insects feed on the leaves in the whorl.',	'Use trichocards twice having 40,000 eggs of Corcyra cephalonica parasitized by Trichogramma chilonis per acre. First release on 10 days old crop and second 7 days after the first release. Cut trichocards into 40 strips, each having approximately 1000 parasitized eggs. Staple these strips uniformly on the underside of the central whorl leaves in evening hours.',	22,	NULL),
(10,	'Punjab',	'Fall armyworm',	'The young larvae feed by scrapping the leaf surface making papery windows. 
The bigger larvae feed voraciously on the central whorl leaves causing round to oblong holes and produce a large amount of faecal matter. 
The larva can be identified by predominant white-coloured inverted Y-shaped mark on the head and presence of four spots arranged in square pattern at the tail end.',	'Sow the crop at recommended time only. 
Avoid staggered sowing of maize in adjacent fields to minimize spread of this pest. 
Regularly monitor the field to collect and destroy egg masses of fall armyworm from leaves. Egg masses are covered with hairs and are easily visible. 
Spray the crop with Coragen 18.5 SC(chlorantraniliprole*) @ 0.4 ml per litre water or Delegate 11.7 SC (spinetoram*) @ 0.5 ml per litre or Missile 5 SG (emamectin benzoate)@ 0.4 g per litre using 120 litres of water per acre, for crop up to 20 days old. Thereafter for older crop, the amount of water used per acre needs to be increased up to 200 litres with corresponding increase in dosage of above insecticides. For effective control, direct the nozzle towards the whorl. 
f the infestation is in patches or the crop is more than 40 days old and spraying is difficult, apply soil-insecticide mixture (about half gram) in the whorls of the infested plants to manage fall armyworm. To prepare soil–insecticide mixture, add 5 ml of Coragen 18.5 SC (chlorantraniliprole*) or Delegate 11.7 SC (spinetoram*) or 5 g of Missile 5 SG (emamectin benzoate) in 10 ml of water and mix well in one kg of soil.',	21,	NULL),
(8,	'Maharashtra',	'Plant Hoppers',	'These mainly occur in the irrigated wetland conditions or in rainfed areas. The presence of pest shows the browning of the yield, sooty moulds and honeydew present in bases where infected.',	'Avoid use of excessive nitrogenous fertilizers.To control, spray with Dichlorvos @ 126 ml or 400 gm Carbaryl in 250 Ltr of water per acre or Imidacloprid @ 40 ml or Quinalphos 25 EC @ 400 ml or Chlorpyriphos @1 Ltr in 100 ltrs of water per acre.',	37,	NULL),
(8,	'Maharashtra',	'Root Weevil',	'he presence of root weevil can be detected by the root and leave damage of yield. These are white legless grub feeds mainly on root. Plant gives yellow appearance, growth gets stunted and few tillers are form',	'Avoid late transplantation.To Control apply Carbaryl (4G)@10 kg either Phorate (10 G)@4 kg or Carbofuran (3 G) @10 kg per acre.',	38,	NULL),
(17,	'Maharashtra',	'Aphids',	'These are nearly transparent, soft-bodied sucking insects. When present in sufficient numbers, aphids can cause yellowing and premature death of leaves. Infestation usually occurs during second fortnight of January till crop harvesting.',	'For management of Aphid, use chrysoperla predators 5-8 thousand/acre or use 50 ml/Ltr neem concentrate. In cloudy weather infestation of aphid is occurred. Spray with Thiamethoxam 80gm or Imidacloprid 40-60 ml/ acre in 100 Ltr of water.',	39,	NULL),
(17,	'Maharashtra',	'Termite',	'Termites attack the crop at various growth stages, from seedlings to maturity. The severely damaged plants can be easily uprooted and look wilted and dried. In case roots are partially damaged, the plants show yellowing.',	'To control broadcast 1 Ltr of Chlorpyriphos 20 EC mix with 20 kg sand/acre then applies a light irrigation.or  80 ml Neonix 20 FS (imidacloprid+hexaconazole) in one litre of water and spray the same on 40 kg seed spread as a thin layer on the pucca ground or tarpaulin or polythene',	40,	NULL),
(9,	'Punjab',	'Stem borers',	'It is highly susceptible to stem borers namely yellow stem borer, white stem borer and pink stem borer. 
The yellow and white stem borers are serious up to flowering stage. 
The pink stem borer generally appears late and is more serious at/after maximum tillering stage when its damage affects grain formation.',	'It can be managed by spraying neem based biopesticide, 80 ml Ecotin (azadirachtin 5%) or 1000 ml Achook/Neem Kavach (azadirachtin 0.15%) or 20 ml Fame 480 SC (flubendiamide*) or 170 g Mortar 75 SG (cartap hydrochloride) or 60 ml Coragen 18.5 SC (chlorantraniliprole*) or 1.0 litre Coroban/Dursban/Lethal/ Chlorguard/Durmet/Classic/Force 20 EC (chlorpyriphos) or 15 g Fipronil 80% WG (fipronil) in 100 litres of water per acre. Prefer Ecotin or Achook/Neem Kavach at pest initiation stage. 
It can also be controlled by applying 4 kg Ferterra 0.4 GR (chlorantraniliprole*) or 4 kg Vibrant 4 GR (thiocyclam hydrogen oxalate) or 10 kg Padan/Caldan/Kritap/Sanvex/ Nidan/Marktap/Miftap/ Faltap-G/ Katsu 4 G (cartap hydrochloride) or 6 kg Regent/Mortel/ Mifpro-G/Mahaveer GR/Shinzen 0.3 G (fipronil) or 4 kg Dursban 10 G (chlorpyriphos) per acre in standing water. Use gloves while applying granular insecticides. ',	16,	NULL),
(10,	'Punjab',	'Maize borer',	'Its larvae first scrape the leaves and then bore into the stem through the whorl or leaf sheath. The central leaves of the attacked whorl get perforated. 
In a young plant, the growing point is killed and a dead-heart results.',	'Kill the borer larvae hibernating in plant remnants like stubbles, stalks, cobs and cores. Plough up the fields after harvesting the maize crop, collect the stubbles and destroy them. Use maize stalks, cobs and cores by the end of February. Chop the remaining stalks, if any, for subsequent use. For seed, keep only healthy cobs, free from borer attack. 
Remove and destroy the plants showing severe borer injury, while hoeing the crop. 
Use trichocards twice having 40,000 eggs of Corcyra cephalonica parasitized by Trichogramma chilonis per acre. First release on 10 days old crop and second 7 days after the first release. Cut trichocards into 40 strips, each having approximately 1000 parasitized eggs. Staple these strips uniformly on the underside of the central whorl leaves in evening hours.',	20,	NULL),
(10,	'Punjab',	'Hairy caterpillars',	'It can cause serious damage by feeding on the leaves and the tender stems. 
When young, they feed gregariously.',	'Use light-traps for the destruction of moths.
Young larvae are gregarious. Destroy them by plucking the infested leaves or by pulling out the infested plants and bury them.
Destroy grown up caterpillars by crushing them under feet or by picking and putting them into kerosenized water.',	23,	NULL),
(10,	'Punjab',	'Mite',	'The affected leaves turn pale and can be recognized from the presence of dusty webs.',	'',	24,	NULL),
(17,	'Punjab',	'Termites',	'It damages the crop soon after sowing and near maturity. 
The damaged plants dry up completely and are easily pulled out. 
The plants damaged at later stages give rise to white ears.',	'Treat the seed by diluting 40 g Cruiser 70 WS (thiamethoxam) or 160 ml Dursban/Ruban/Durmet 20 EC (chlorpyriphos) or 80 ml Neonix 20 FS (imidacloprid+hexaconazole) in one litre of water and spray the same on 40 kg seed spread as a thin layer on the pucca ground or tarpaulin or polythene. 
Seed treated with Neonix also control smuts of wheat. 
Seed treated with insecticide is less attacked by birds.',	25,	NULL),
(17,	'Punjab',	'Aphids',	'It damages the crop resulting in discolouration of leaves.',	'In case aphid infestation exceeds economic threshold level of 5 aphids per earheads (recorded from 10 randomly selected ear heads in each of the 4 quarters of one acre field), give two sprays of 2 litre PAU homemade neem extract at weekly interval or single spray of 20 g Actara/Taiyo 25 WG (thiamethoxam) in 80- 100 litres of water per acre using knap sack sprayer or in 30 litres of water per acre with power sprayer. 
Insecticides should be applied only if the aphid attack appears on earhead stage. 
Since the aphids appear first on borders of the crop, spray only the infested strip to check their further spread.',	26,	NULL),
(17,	'Punjab',	'Army worm',	'It attacks usually wheat during March-April, however it is also observed in the month of December in fields having large loads of paddy straw. 
It damages leaves and earheads.',	'Spray 400 ml Ekalux (quinalphos) in 80-100 litres of water per acre with hand-operated knapsack sprayer or in 30 litres of water with motorized sprayer. For better effectiveness of the insecticide, spraying should be done in the evening when armyworm larvae are more active. This insecticide will also control aphids.',	27,	NULL),
(17,	'Punjab',	'Pink stem borer',	'It generally attacks the wheat crop at seedling stage. 
The larva bore into the stem of young plant and kills the central shoot causing dead heart.',	'If the severe damage of pink stem borer is observed in previous rice crop, avoid sowing of wheat in the month of October.
Prefer to irrigate the fields during day time to maximize predation of insects by birds.',	28,	NULL),
(17,	'Punjab',	'Gram pod borer',	'It attacks wheat at maturity. It feeds on the grains in the earheads.',	'Spray 800 ml Ekalux 25 EC (quinalphos) in 100 litres of water per acre with hand operated knap sack sprayer.',	29,	NULL),
(17,	'Punjab',	'Brown mite',	'It is a minor insect of wheat causing discolouration of leaves. 
It is of very small size and attack is more observed on rainfed wheat.',	'',	30,	NULL),
(8,	'Maharashtra',	'Stem borers',	'The affected young plants show dead-hearts (yellowing and drying of central shoot) whereas the old ones produce empty earheads which turn white and stand erect. Stem borers can destroy rice at any stage of the plant from seedling to maturity.The larvae of these insects bore into the stem and cause damage.',	'Spray any one of the following Monocrotophos 36 SL 400 ml/Acre (or) Quinalphos 25 EC 400 ml/Acre (or) Phosphamidon 40 SL 240  ml/Acre (or) Profenophos 50 EC 400 ml/Acre.. Further application of any of these insecticides may be repeated as and when damage reaches economic threshold level. Prefer Ecotin at pest initiation stage.',	31,	NULL),
(8,	'Maharashtra',	'Rice hispa or Spiny Beetle',	'The grubs of this pest tunnel into the leaves, whereas the adults are exposed feeders. The grubs cause damage by producing bold, white streaks on the leaves.',	'Avoid over fertilizing the field.spray of Cartap hydrochloride @ 170 gm or Triazophos @ 350 ml or Chlorpyriphos @ 1 Ltr per 100 Ltr of water.',	35,	NULL),
(8,	'Maharashtra',	'Leaf folder',	'This pest develops in high humidity and specifically found where rice is fertilized heavily. Larva fold the leaves and eat the plant tissue and produces white streaks.',	'Avoid over fertilizing the field.spray ofCartap hydrochloride @ 170 gm or Triazophos @350 ml or Chlorpyriphos @1 Ltr in 100 Ltr of water per acre.',	36,	NULL),
(8,	'Meghalaya',	'Stem Borers',	'Caterpillars that bore into stem cause the damage and feed internally causing the death of central shoot known as Dead Heart.
Affected plants produce white chaffy ear-head at flowering stage. 
Just after hatching larvae migrates between the leaf sheaths where they are protected from natural enemies and insecticidal sprays.',	'Management :
* Plough and destroy the stubbles after harvest, collect and destroy egg masses in nursery plants.* Clip off the leaf tips and burn to kill eggs or larvae preventing them from carrying into the main field.
Chemical Control :
* Dip the root of seedlings before transplanting in a solution of chlorpyriphos 1 ml in 1 litre of water for four hours.
* Apply carbofuran 3G @ 20-25 kgs per hectare at 20 and 40 days after transplanting. If the pest appears spray the crop with endosulfan (20 ml) or Carbaryl (36gm) or Quinalphos (27ml) in 18 litre water.',	41,	NULL),
(8,	'Meghalaya',	'Army Worms',	'A full grown caterpillar is dull green in colour with four longitudinal stripes and an orange or brown head . 
Caterpillars feed on the leaves and in severe infestation entire seed beds and fields are destroyed and the fields appears as if it has been grazed by animals /cattles. 
The larvae feed voraciously in the night and hide in the soil during the day time.',	'Management :
* Regular survey of crop at and before maturity. Keep the field under water through proper water management.
* Place straw beds in the fields at several locations. Collect /destroy hiding caterpillars.* Spray the Bunds with pesticides to prevent migration of pest from one plot to another.
Chemical Control : Spray the crops with any of the chemicals as mentioned in the spray schedule under stem borers.',	42,	NULL),
(8,	'Meghalaya',	'Leaf Folders',	'The adult moths are brownish orange in colour 8-10 mm long with a wing span of 12-20mm. 
The larva infests the leaves, roll them longitudinally, live inside and feed on the green matter.',	'Remove grasses and weeds from the nearby field which are alternate host of the pest.
Chemical Control : When Infestation is observed spray the crop with the chemicals as recommended earlier.',	44,	NULL),
(8,	'Meghalaya',	'Case Worm',	'Adults are 6mm long with wing span of 15mm. 
Slender green coloured caterpillars cut leaf blades into length of about half out of which they make tubular cases with which they feed. 
Several tubes are seen hanging from the plants. 
The caterpillars often drop suddenly on the surface of water and paddle along till it reaches another plants.
During heavy damage, leaves are skeletonised and appear whitish in colour.',	'Drain water from the field to flush out the insects and tubular cases floating in the field.
Chemical Control : Spray the crop with Quinalphos or Endosulphan solution @ 27ml either one of the chemicals in 18 litres of water.',	45,	NULL),
(8,	'Meghalaya',	'Plant Hopper',	'The adult hopper is light to dark brown in colour measuring about 3-4mm in body length. 
Both nymphs and adults damage the plants by sucking the sap. 
During the early stage of plant growth reduces height, general vigour and infested plants turn yellow and dries up. 
At later stages, crop dries up in patches known as hopper burn.',	'Drain water from the field to flush out the insects and tubular cases floating in the field.
a. Clean cultivation by timely weeding to reduce pest population.
b. Adopt spacing as recommended.
c. Use resistant varieties.
Chemical Control : Spray the crop with Quinalphos or Endosulphan solution @ 27ml either one of the chemicals in 18 litres of water.',	46,	NULL),
(8,	'Meghalaya',	'Root Knot Nematodes',	'Those are tiny worms like living bodies. 
These causes formation of galls on the roots. 
It attacks the crops during early growth stages and is severe in uplands. 
The infected plants look stunted with orange yellow leaves and highly reduced yield.',	'* Use resistant varieties.
* Provide staking for perching birds.
* Seed/ Seedlings treatment to reduce field protection.
* Place straw on bunds and in fields at several locations collect/destroy hiding caterpillars.* Check the nursery, clip off affected leaves if infestation is noticed.
Chemical Control : Apply Carbofuran Granules @ 20-25 Kg in nursery at 7 and 50 days after transplanting help control the destruction by root knot nematodes.',	47,	NULL),
(10,	'Maharashtra',	'Corn worm',	'Larva feeds on silk and developing grains. Larva of corn worms shows color variation from greenish to brown. It has dark brown grey lines on the body with lateral white lines.',	'Set up pheromone traps at @6 /acre. Apply Carbaryl 10 D @10kg/acre or Malathion 5 D @ 10kg/acre on 3rd and 18th day after panicle emergence.',	53,	'FOk0XMoo7I.png'),
(10,	'Maharashtra',	'Shoot bug',	'Shoot bug laid eggs inside leaf tissue and covered with a white waxy substance. Due to infestation plant become unhealthy, stunted and yellow. The leaves wither from top to downwards. The midribs of the leaves turn red due to egg-laying and may dry up subsequently.',	'infestation is observed take spray of Dimethoate @ 2 ml/Ltr of water.',	54,	'lxTCeICEp2.png'),
(8,	'Madhya Pradesh',	'Leaf folder',	'The caterpillar of this insect is green in color, which connects the two sides of the leaf with its spit. Later the leaves dry up.',	'Spray of Cartap hydrochloride @ 170 gm or Triazophos @350 ml or Chlorpyriphos @1 Ltr in 100 Ltr of water per acre.',	50,	NULL),
(8,	'Madhya Pradesh',	'Stem borers',	'The stem borer insect attacks the plant at the stage of flowering and damages the central part and as a result the plant dries up.',	'Spray any one of the following Monocrotophos 36 SL 400 ml/Acre (or) Quinalphos 25 EC 400 ml/Acre .Prefer Ecotin at pest initiation stage.',	51,	NULL),
(10,	'Maharashtra',	'Stalk borer or stem borer',	'Chilo partellus, commonly known as stalk borer that appears throughout the monsoon time period. It is a serious bug all over the nation. Chilo lays eggs 10-25 nights after germination on inferior portion of the leaf. The larva gets into in the whorl and then triggers deterioration in the leaf and cause shot hole. Larva of stem borer is yellowish brown with a brown head.',	'Mix Phorate 10 Percentage   CG @5kg/acre or Carbaryl 4 Percentage  G @ 1 kg/acre with sand to make up total quantity of 10 kg and apply in the leaf whorls on the 20th day of sowing. Or Spray insecticide like Carbaryl 50 WP @ 1 kg/acre on the 20th day of sowing or Dimethoate 30 percentage  EC @ 250ml/acre. Spray of Chlorpyriphos @ 1-1.5 ml/Ltr of water at 10-12 days after germination provides good control.',	52,	'CPut1yF0bU.jpg'),
(10,	'Maharashtra',	'Termites',	'Serious pest of maize observed in most areas.',	'apply Fipronil@6kg/acre followed by light irrigation. If the termite incidence is in patches, than spot application of Fipronil@2-3kg granuled/plant should be done. Keep cleanliness in field.',	56,	'L7W0cf7MED.png'),
(10,	'Maharashtra',	'Shoot fly',	'It is a major pest of South India but sometime observed in spring and summer crop in North India. It causes damage at seedling stage and causes drying of seedling or dead heart.',	'Do seed treatment with Imidacloprid @ 6 ml/kg of seeds, it provides good control of the shoot fly. Soil application of Phorate 10%  CG@4kg/acre at the time of sowing. Spray any one of pesticide like Dimethoate 30%  EC@300 ml/acre or Methyl demeton 25% EC@400 ml/acre.',	55,	'3Kbyk2uv4P.png');



DROP TABLE IF EXISTS "portal_core_users";
DROP SEQUENCE IF EXISTS portal_core_users_id_seq;
CREATE SEQUENCE portal_core_users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."portal_core_users" (
    "id" integer DEFAULT nextval('portal_core_users_id_seq') NOT NULL,
    "username" character varying(200) NOT NULL,
    "password" character varying(200) NOT NULL,
    "email" character varying(200) NOT NULL,
    "created_on" date NOT NULL,
    "last_login" date NOT NULL,
    CONSTRAINT "portal_core_users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "rodent";
DROP SEQUENCE IF EXISTS rodent_id_seq;
CREATE SEQUENCE rodent_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."rodent" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "symptoms" character varying,
    "measures" character varying,
    "id" integer DEFAULT nextval('rodent_id_seq') NOT NULL,
    CONSTRAINT "rodent_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "rodent" ("crop_id", "state", "name", "symptoms", "measures", "id") VALUES
(8,	'Punjab',	'Rats and mice',	'They cause more damage at seedling and ripening stages of the crops.',	'Do poison baiting in the month of August-September using 400 g per acre zinc phosphide or bromadiolone bait. The baiting must be done during dry days and before milky grain stage. Otherwise, if delayed, the rats would avoid poison bait due to the availability of fresh grains in the crop.',	3),
(9,	'Punjab',	'Rats and mice',	'They cause more damage at seedling and ripening stages of the crops.',	'Do poison baiting in the month of August-September using 400 g per acre zinc phosphide or bromadiolone bait. The baiting must be done during dry days and before milky grain stage. Otherwise, if delayed, the rats would avoid poison bait due to the availability of fresh grains in the crop.',	4),
(17,	'Punjab',	'Rats and mice',	'They cause more damage at seedling and ripening stages of the crops.',	'Do poison baiting in the month of August-September using 400 g per acre zinc phosphide or bromadiolone bait. The baiting must be done during dry days and before milky grain stage. 
Otherwise, if delayed, the rats would avoid poison bait due to the availability of fresh grains in the crop.',	5),
(8,	'Maharashtra',	'Rats, Gerbil and Mice',	'They cause more damage at seedling and ripening stages of the crops.',	'Do poison baiting in the month of August-September using 400 g per acre zinc phosphide or bromadiolone bait. The baiting must be done during dry days and before milky grain stage. Otherwise, if delayed, the rats would avoid poison bait due to the availability of fresh grains in the crop.',	6),
(17,	'Maharashtra',	'Rats, Gerbil and Mice',	'They cause more damage at seedling and ripening stages of the crops.',	'Do poison baiting in the month of August-September using 400 g per acre zinc phosphide or bromadiolone bait. The baiting must be done during dry days and before milky grain stage. Otherwise, if delayed, the rats would avoid poison bait due to the availability of fresh grains in the crop.',	8);

DROP TABLE IF EXISTS "soil";
DROP SEQUENCE IF EXISTS soil_id_seq;
CREATE SEQUENCE soil_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."soil" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "type" character varying NOT NULL,
    "water_content" character varying,
    "ph" character varying,
    "id" integer DEFAULT nextval('soil_id_seq') NOT NULL,
    "water_content_min" integer,
    "water_content_max" integer,
    "ph_min" double precision,
    "ph_max" double precision,
    CONSTRAINT "soil_pkey" PRIMARY KEY ("crop_id", "state", "type"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "soil" ("crop_id", "state", "type", "water_content", "ph", "id", "water_content_min", "water_content_max", "ph_min", "ph_max") VALUES
(8,	'Maharashtra',	'Black Soil',	'0',	'[7.2 - 8.4]',	9,	NULL,	NULL,	NULL,	NULL),
(10,	'Punjab',	'Sandy-loam, Silty-loam',	'[0,0]',	'7',	8,	NULL,	NULL,	NULL,	NULL),
(8,	'Madhya Pradesh',	'Black soil (Regur Soils/Black cotton soil)',	NULL,	NULL,	29,	0,	0,	7.2,	8.5),
(8,	'Madhya Pradesh',	'Red and Yellow soil',	NULL,	NULL,	30,	0,	0,	5.5,	8.5),
(8,	'Madhya Pradesh',	'Alluvial soil',	NULL,	NULL,	31,	0,	0,	7.5,	8),
(8,	'Madhya Pradesh',	'Mixed soil',	NULL,	NULL,	32,	0,	0,	7.2,	8.5),
(8,	'Meghalaya',	'Sandy loam',	NULL,	NULL,	34,	0,	0,	5,	6),
(8,	'Punjab',	'Loamy soil',	'Max[ 10 cm ]',	'[ 5, 9 ]',	6,	10,	10,	5,	9),
(9,	'Punjab',	'Loamy soil',	'Max[ 10 cm ]',	'[ 5, 9 ]',	7,	10,	10,	5,	9);

DROP TABLE IF EXISTS "user_info";
DROP SEQUENCE IF EXISTS user_info_id_seq;
CREATE SEQUENCE user_info_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."user_info" (
    "id" integer DEFAULT nextval('user_info_id_seq') NOT NULL,
    "mobile_number" character varying NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying,
    "state" character varying NOT NULL,
    "password" character varying NOT NULL,
    CONSTRAINT "user_info_mobile_number_key" UNIQUE ("mobile_number"),
    CONSTRAINT "user_info_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "user_info" ("id", "mobile_number", "first_name", "last_name", "state", "password") VALUES
(2,	'345',	'test-pb',	'',	'Telangana',	'test'),
(3,	'12345',	'test-pb',	'',	'Assam',	'test'),
(4,	'99935',	'yog',	'vai',	'Andhra Pradesh',	'99935'),
(5,	'eqwe',	'a',	'',	'Andhra Pradesh',	'ewe'),
(1,	'1111111111',	'test-user',	'test-last-name',	'Punjab',	'test');





DROP TABLE IF EXISTS "varieties_in_state";
CREATE TABLE "public"."varieties_in_state" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "varieties" character varying,
    CONSTRAINT "varieties_in_state_pkey" PRIMARY KEY ("state", "crop_id"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "variety";
DROP SEQUENCE IF EXISTS variety_id_seq;
CREATE SEQUENCE variety_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."variety" (
    "id" integer DEFAULT nextval('variety_id_seq') NOT NULL,
    "crop_id" integer NOT NULL,
    "state" character varying,
    "variety_name" character varying NOT NULL,
    "seed_rate" character varying,
    "sowing_time" character varying,
    "duration" character varying,
    "average_yield" character varying,
    "height" character varying,
    "features" character varying,
    "suitable_regions" character varying,
    "tolerant_to" character varying,
    "added" timestamp DEFAULT CURRENT_TIMESTAMP,
    "v_image" character varying(1000),
    "seed_rate_min" integer,
    "seed_rate_max" integer,
    "duration_min" integer,
    "duration_max" integer,
    "average_yield_min" double precision,
    "average_yield_max" double precision,
    "height_min" double precision,
    "height_max" double precision,
    CONSTRAINT "variety_pkey" PRIMARY KEY ("variety_name", "crop_id"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "variety" ("id", "crop_id", "state", "variety_name", "seed_rate", "sowing_time", "duration", "average_yield", "height", "features", "suitable_regions", "tolerant_to", "added", "v_image", "seed_rate_min", "seed_rate_max", "duration_min", "duration_max", "average_yield_min", "average_yield_max", "height_min", "height_max") VALUES
(116,	8,	'Maharashtra',	'Phule Samruddh (2007)',	'',	'Jun-July',	'125-130',	'40-45',	'',	'Semi dwarf & non-lodging, midlate group, long slender grain, small notch at back of seed.',	'Rice growing areas of western Maharashtra',	'',	'2022-03-14 10:08:51.585948',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(97,	8,	'Maharashtra',	'Ratnagiri 711 (1978)',	'',	'Jun-July',	'115',	'45',	'',	'Semi dwarf stature, long slender grain, suitable for light & medium type soils, suitable for both kharif and hot weather conditions, can be grown under dibbled and transplanted conditions',	'Rice growing areas of Maharashtra',	'',	'2022-03-10 05:36:28.223051',	'zBau2dZ1vA.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(84,	8,	'Maharashtra',	'Sahyadri (Hybrid-1998)',	'',	'Jun-July',	'130',	'65',	'119',	'First rice hybrid released in Maharashtra state, semi dwarf stature, long slender grain, resistant to leaf blast & leaf scald, mild aroma',	'Rice growing areas of Maharashtra State including Kharland',	'',	'2022-03-09 09:01:47.107453',	'Mpz6PJAVF0.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(210,	17,	'Madhya Pradesh',	'MP 1106 (d)',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust and blight',	'2022-04-07 06:49:15.436826',	'',	0,	60,	115,	120,	22,	24,	0,	0),
(211,	17,	'',	'Lok 1',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Tolerant to  rust and blight',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust and blight',	'2022-04-07 06:51:10.543807',	'',	0,	40,	105,	110,	17,	18,	0,	0),
(6,	8,	'Punjab',	'PR 129 (2020)',	'8',	'May 20-25',	'108',	'30',	'105',	'It possesses long slender clear translucent grains.',	'',	'It is resistant to all the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(212,	17,	'Madhya Pradesh',	'GW 173',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust ,loose smut and blight',	'2022-04-07 06:52:24.037769',	'',	0,	40,	100,	105,	17,	18,	0,	0),
(7,	8,	'Punjab',	'PR 128 (2020)',	'8',	'May 20-25',	'111',	'30',	'110',	'It possesses long slender clear translucent grains.',	'',	'All the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(9,	8,	'Punjab',	'PR 127 (2018)',	'8',	'May 25-31',	'107',	'30',	'104',	'It possesses long slender, clear translucent grains with high total and head rice recoveries',	'',	'All the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(10,	8,	'Punjab',	'PR 126 (2017)',	'8',	'May 25-June 5',	'93',	'30',	'102',	'It possesses long slender, clear translucent grains.',	'',	'Resistant to seven of the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(15,	8,	'Punjab',	'PR 122 (2013)',	'8',	'May 20-25',	'117',	'31',	'108',	'It possesses long slender translucent grains.',	'',	'Resistant to all the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(16,	8,	'Punjab',	'PR 121 (2013)',	'8',	'May 20-25',	'110',	'30',	'98',	'Its grains are long slender, translucent with good cooking quality.',	'',	'Resistant to all the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(17,	8,	'Punjab',	'PR 114 (1999)',	'8',	'May 20-25',	'115',	'27',	'102',	'It possesses extra long, clear translucent grains.',	'',	'Resistant to five of the ten pathotypes of bacterial blight pathogen presently prevalent in Punjab state',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(183,	8,	'Meghalaya',	'Meg Rice 1',	'20',	'Mid April to first week of May',	'165',	'35',	'',	'',	'High altitude (above 1300m)',	'',	'2022-04-05 07:34:52.59834',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(184,	8,	'Meghalaya',	'Meg Rice 2',	'20',	'Mid April to first week of May',	'160',	'35',	'',	'',	'High altitude (above 1300m)',	'',	'2022-04-05 07:35:56.374356',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(185,	8,	'Meghalaya',	'RCPL 1-29',	'17',	'May to June',	'130',	'42',	'',	'',	'Upland : Mid altitude (800-1300m)',	'Resistant to blast',	'2022-04-05 07:37:00.650638',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(186,	8,	'Meghalaya',	'RCPL 1-28',	'17',	'May to June',	'130',	'40',	'',	'',	'Upland : Mid altitude (800-1300m)',	'Resistant to blast',	'2022-04-05 07:37:51.080447',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(187,	8,	'Meghalaya',	'I.E.T 13783',	'17',	'May to June',	'120',	'30',	'',	'',	'Upland : Mid altitude (800-1300m)',	'Resistant to blast',	'2022-04-05 07:38:45.64558',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(188,	8,	'Meghalaya',	'I.E.T 13459',	'17',	'May to June',	'120',	'30',	'',	'',	'Upland : Mid altitude (800-1300m)',	'Resistant to blast',	'2022-04-05 07:39:29.71748',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(180,	8,	'Meghalaya',	'RCPL 1-87-8',	'17',	'May to June',	'145',	'50',	'',	'Red kernels but become white after milling.',	'Mid altitude (800-1300m)',	'',	'2022-04-05 07:30:27.204091',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(8,	8,	'Punjab',	'HKR 47 (2020)',	'8',	'May 25-31',	'104',	'29',	'117',	'It possesses long slender, clear translucent grains.',	'',	'All the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state and is prone to lodging.',	'2022-03-08 10:14:38.318448',	',',	8,	8,	104,	104,	29,	29,	117,	117),
(230,	10,	'Maharashtra',	'Phule Madhu (QMHSC-1182)',	NULL,	'15th June to 15th July',	NULL,	NULL,	NULL,	'Suitable for Kharif season',	'Entire state',	'Resistant to Turcicum leaf blight, maydis leaf blight, Banded leaf and sheath blight and charcoal rot.',	'2022-04-21 04:18:49.521956',	'',	6,	8,	80,	85,	50,	52,	0,	0),
(181,	8,	'Meghalaya',	'RCPL 1-87',	'17',	'May - June',	'145',	'45',	'',	'Red kernels but become white after milling.',	'Mid altitude (800-1300m)',	'',	'2022-04-05 07:31:43.426689',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(182,	8,	'Meghalaya',	'RCPL 1-3',	'17',	'May to June',	'140',	'45',	'',	'Red kernels but become white after milling',	'Mid altitude (800-1300m)',	'',	'2022-04-05 07:33:32.052021',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(117,	8,	'Maharashtra',	'RDN-185- 2 (1971)',	'',	'Jun-July',	'120-125',	'30-35',	'',	'',	'Western Maharashtra',	'',	'2022-03-15 05:35:00.648778',	'FsSjI8tkaR.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(118,	8,	'Maharashtra',	'Phule Radha (2004)',	'',	'Jun-July',	'110-115',	'35-40',	'',	'Moderately resistant to blast & bacterial leaf blight',	'Rice growing areas of Maharashtra',	'',	'2022-03-15 05:53:14.609261',	'lPl7TvKqch.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(119,	8,	'Maharashtra',	'Bhogawati  (2004)',	'',	'Jun-July',	'130-138',	'35-40',	'',	'Fragrant, heat-laden, moderately tolerant of bacterial leaves',	'Rice growing areas of Maharashtra',	'',	'2022-03-15 06:01:02.150632',	'th9RUL6gSV.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(120,	8,	'Maharashtra',	'Darana (1980)',	'',	'Jun-July',	'130-135',	'35-40',	'',	'short bold, AWA, resistant to blast, moderately resistant to leaf & scald, highly resistant to major pests.',	'Rice growing areas of Maharashtra',	'',	'2022-03-15 06:28:24.673378',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(122,	8,	'Maharashtra',	'SKL 6 (1985)',	'',	'Jun-July',	'115-120',	'40-45',	'',	'R-Blast, Suitable for Kharif & Rabi, LS grain',	'Rice growing areas of Maharashtra',	'',	'2022-03-15 06:52:47.692113',	'G6QofoKqLh.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(124,	8,	'Maharashtra',	'SKL-8(2000)',	'',	'Jun-July',	'140-145',	'40-45',	'',	'Multiple pest and disease resistance, long bold grain type',	'Rice growing areas of Maharashtra',	'',	'2022-03-15 09:30:55.156744',	'18w63yNlFF.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(121,	8,	'Maharashtra',	'PKV-Ganesh (2003)',	'',	'Jun-July',	'126-128',	'45-50',	'',	'',	'Eastern part of Vidarbha',	'',	'2022-03-15 06:43:01.956242',	'BEP0KTIIbT.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(127,	17,	'Maharashtra',	'NI-5643 (1973)',	'40',	'First Fortnight of Novermber',	'120-125',	'10-12',	'85-100',	'Better chapati quality ,Tolerant to aphids Remark High yielding variety under timely sown irrigated condition',	'Entire state',	'',	'2022-03-19 08:40:08.540974',	'6J8mgs7bc3.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(128,	17,	'Maharashtra',	'Nl-5749 (1975)',	'30',	'Second Fortnight of October',	'100-110',	'4-6',	'85-100',	'Non-waxy, tall type,Tolerant to aphids',	'Suitable for Rainfed conditions',	'',	'2022-03-19 08:43:36.459137',	'dLgY2Ivp6S.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(129,	17,	'Maharashtra',	'Vinata [N-8223]  (1985)',	'30',	'Second Fortnight of October',	'100-110',	'5-6',	'85-100',	'Erect type with broad leaves,Better chapati quality,Tolerant to aphids,Tolerant to rust',	'Suitable for Rainfed conditions',	'',	'2022-03-19 08:48:19.455374',	'sIZtSbsGy5.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(132,	17,	'Maharashtra',	'Niphad [NIAW-34] (1995)',	'50',	'First Fortnight of December',	'100-110',	'14-16',	'85-100',	'Medium size grain,Tolerant to aphids 4,Resistant to Black and Brown rust 5,Protein content more than 13 Percentage',	'Entire state',	'',	'2022-03-19 09:10:48.741161',	'5wsRrJrBA5.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(133,	17,	'Maharashtra',	'Kadava (NI-9947) (1995)',	'50',	'First Fortnight of December',	'90-105',	'10-12',	'85-100',	'Better chapati quality,Tolerant to aphids, Resistant to Black and Brown rust,Protein content 13.8 Percentage',	'Entire state',	'',	'2022-03-19 09:14:15.529709',	'sHhmzfiFDb.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(134,	17,	'Maharashtra',	'Trambak (NIAW-301) (2001)',	'40',	'First Fortnight of Novermber',	'110-115',	'16-18',	'85-100',	'Medium sized grains, Best chapati quality, Tolerant to aphids, Resistant to rust, Protein content 12 Percentage',	'Entire state',	'',	'2022-03-19 09:24:27.749725',	'eDqRu1GWZ5.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(137,	17,	'Maharashtra',	'Phule Samadhan [NIAW-1994]',	'40',	'First Fortnight of Novermber',	'115-120',	'18-20',	'85-100',	'Bold size grains,Best for chapati making,Tolerant to aphids,Highly Resistant to rust,Protein content more than 12 percentage',	'Suitable for Rainfed and restricted irrigated',	'',	'2022-03-19 09:38:00.929426',	'9ZgvVfxktx.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(32,	10,	'Punjab',	'ADV 9293 (2021)',	'10',	'Last week of May to end of June',	'97',	'25',	'',	'This single cross hybrid has tall plants with medium ear height. Stem is sturdy and leaves are broad. Tassel is medium and open. Ears are long with attractive orange flint grains.',	'',	'It is moderately resistant to maydis leaf blight, charcoal rot and maize stem borer.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(138,	17,	'Maharashtra',	'Pusa Wheat 8777 (HI 8777)  2018',	'45',	'First Fortnight of Novermber',	'105-110',	'17-19',	'85-100',	'High levels of essential micronutrients like iron and zinc etc.',	'Entire state',	'Tolerant to heat stress, stem rust, leaf rust, Karnal bunt, loose smut, flag smut and foot rot',	'2022-03-19 14:07:37.192782',	'VqOpaSYmvP.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(126,	17,	'Maharashtra',	'NI-5439  (1972)',	'30',	'Second Fortnight of October',	'100-110',	'5-6',	'85-100',	'Recommended for rainfed conditions of Peninsular Zone,Drought and heat tolerant,Excellent for chapati,',	'Suitable for Rainfed conditions',	'Tolerant to aphids',	'2022-03-19 08:37:46.220299',	'nxK1oZ83sz.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(139,	17,	'Maharashtra',	'LOK 1 (1981)',	'40',	'',	'100-105',	'14-16',	'',	'Earhead medium dence, awned, grain bold, grain colour amber.',	'Entire state',	'',	'2022-03-22 04:39:44.73088',	'vdxm6UhfV1.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(135,	17,	'Maharashtra',	'Godavari [NIDW-295] (2005)',	'40',	'First Fortnight of Novermber',	'110-115',	'18-20',	'85-100',	'Medium sized grains,Best chapati quality,Tolerant to aphids,Resistant to rust,Protein content 12 Percentage',	'Entire state',	'',	'2022-03-19 09:28:53.064382',	'MBPrMBIC24.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(136,	17,	'Maharashtra',	'Netravati [NIAW-1415] (2010)',	'40',	'First Fortnight of Novermber',	'110-115',	'10-12',	'85-100',	'Medium size grains,Best for chapati making,T,Protein content more than 12 Percentage  ,It has enriched with micronutrients like Iron (Fe) 48.4 ppm, Zinc (Zn) 33.4 ppm, Copper (Cu) 5.99 ppm, Manganese (Mn) 38.6 ppm',	'Suitable for Rainfed and restricted irrigated',	'olerant to aphids,Resistant to black and brown rust',	'2022-03-19 09:33:58.054146',	'B232UIJ2UN.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(123,	8,	'Maharashtra',	'SKL-7 (1988)',	'',	'Jun-July',	'120-130',	'40-45',	'',	'',	'Rice growing areas of Maharashtra',	'',	'2022-03-15 07:19:45.915664',	'd6cvEQGzhN.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(125,	8,	'Maharashtra',	'PKV- KISAN (2012)',	'',	'Jun-July',	'130-135',	'40-42',	'',	'Resistant to Gall Midge biotype 4, Leaf blast, Bacterial Leaf blight, and moderate resistance to Neck blast',	'Eastern part of Vidarbha',	'',	'2022-03-15 09:54:42.923333',	'qHND4YGsA6.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(213,	10,	'Maharashtra',	'Hunis',	NULL,	'15th June to 15th July',	NULL,	NULL,	NULL,	'Suitable for Kharif and Rabi. Suitable for intercropping in sugarcane.',	'Entire state',	'Moderately resistant to stem borer & rust.',	'2022-04-20 05:21:58.026856',	'',	6,	8,	85,	90,	18,	20,	0,	0),
(30,	9,	'Punjab',	'Pusa Basmati 1121 (2008)',	'',	'First fortnight of June',	'107',	'14',	'120',	'It possesses extra long slender grains with good cooking quality. 
It has longest cooked rice length among all the aromatic rice varieties recommended for Punjab.',	'',	'It is susceptible to all the pathotypes of bacterial blight pathogen prevalent in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(217,	10,	'Maharashtra',	'Hunis(Rabi)',	NULL,	'15th October to 15th November',	NULL,	NULL,	NULL,	'Suitable for Kharif and Rabi. Suitable for intercropping in sugarcane.',	'Entire state',	'Moderately resistant to stem borer & rust.',	'2022-04-20 05:40:25.902579',	'',	6,	8,	85,	90,	18,	20,	0,	0),
(218,	10,	'Maharashtra',	'Manjri',	NULL,	'15th June to 15th July',	NULL,	NULL,	NULL,	'Suitable for Kharif and  Rabi. Suitable for grain as well as fodder purpose.',	'Entire state',	'Resistant to major pests and diseases',	'2022-04-20 05:44:21.138491',	'',	6,	8,	100,	110,	20,	22,	0,	0),
(220,	10,	'Maharashtra',	'Panchganga',	NULL,	'15th June to 15th July',	NULL,	NULL,	NULL,	'It is early maturing composite. It has white semi flint grains.',	'Entire state',	'Moderately resistant to major pests and diseases',	'2022-04-20 06:06:27.43728',	'',	6,	8,	85,	90,	18,	22,	0,	0),
(222,	10,	'Maharashtra',	'Panchganga (Rabi)',	NULL,	'15th October to 15th November',	NULL,	NULL,	NULL,	'It is early maturing composite. It has white semi flint grains.',	'Entire state',	'Moderately resistant to major pests and diseases',	'2022-04-20 08:44:26.291322',	'',	6,	8,	85,	90,	18,	22,	0,	0),
(223,	10,	'Maharashtra',	'Karveer (MPQ-13)',	NULL,	'15th June to 15th July',	NULL,	NULL,	NULL,	'It is Medium maturity. Non lodging',	'Entire state',	'Moderately resistant to Chilo partellus and Sitophilus oryzae.',	'2022-04-20 10:12:56.119839',	'',	6,	8,	95,	100,	21,	22,	0,	0),
(140,	17,	'Maharashtra',	'AKAW-4627 (2012)',	'40',	'',	'95-100',	'15-16',	'',	'Non waxy flag leaf with semi erect angle, ears club shaped, outer glume slightly pubescent, medium bold ovate shaped grains.',	'Entire state',	'',	'2022-03-22 04:54:17.130548',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(143,	17,	'Maharashtra',	'MACS-6222 (2010)',	'40',	'',	'102-106',	'19-20',	'',	'Growth habit semi erect, strong waxy sheath and blade, grain lustrous, amber in colour and ovate in shape, earhead strong waxy.',	'',	'Resistant to stem and leaf rust pathogens and climatic variations.',	'2022-03-22 06:38:26.547625',	'8JzAJz4i13.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(144,	17,	'Maharashtra',	'HI-1418 (CHANDOUSI) (1999)',	'40',	'',	'110-120',	'16-18',	'',	'Growth habit semi erect, strong waxy sheath and blade, grain lustrous, amber in colour and ovate in shape, earhead strong waxy.',	'Entire state',	'Tolerant towards Dana Sharbati diseases',	'2022-03-22 09:28:41.851413',	'26I7Iga2P2.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(145,	17,	'Maharashtra',	'GW-496 (1990)',	'40',	'',	'96-113',	'18-19',	'',	'Early growth habit Semi erect, good tillering capacity, colour of stem & foliage deep green with bloom & pale grain hairy auricle.',	'Entire state',	'',	'2022-03-22 09:42:11.860811',	'KH4LtVS33i.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(146,	17,	'Maharashtra',	'PURNA (HI-1544) (2008)',	'40',	'',	'115-120',	'19-23',	'',	'Growth habit semi erect, Grain colour amber and hard, roundish grain shape, elliptical & medium dense earhead.',	'Entire state',	'Terminal heat stress along with high resistance to stem and leaf rusts.',	'2022-03-22 09:51:33.753902',	'd2GuFV9n3W.jpeg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(224,	10,	'Maharashtra',	'Karveer (MPQ-13) (Rabi)',	NULL,	'15th October to 15th November',	NULL,	NULL,	NULL,	'It is Medium maturity. Non lodging',	'Entire state',	'Moderately resistant to Chilo partellus and Sitophilus oryzae.',	'2022-04-20 10:15:49.038835',	'',	6,	8,	95,	100,	26,	27,	0,	0),
(142,	17,	'Maharashtra',	'MACS-6478 (2014)',	'40',	'',	'100-110',	'18-19',	'',	'Growth habit semi-erect, earhead medium waxy, dark green foliage, medium waxiness on leaf spike & culm, Protein content 14 Percentage',	'Entire state',	'Highly resistant to both black & brown rusts',	'2022-03-22 05:25:34.219789',	'5IhG2kJ5ds.webp,',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(147,	17,	'Maharashtra',	'POSHAN (HI-8663) (2008)',	'40',	'',	'115-120',	'18-20',	'',	'Growth habit semi erect, white & glabrous, elliptical & medium dense earhead, white auricle, semi dwarf plant with waxy bloom, bold amber & hard grain, Non-lodging & non-shattering.',	'Entire state',	'Tolerant to terminal heat stress.',	'2022-03-22 10:43:48.828107',	'5TDGde3JrM.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(148,	17,	'Maharashtra',	'HI-8759 (PUSA TEJAS) (2017)',	'40',	'',	'109-136',	'21-22',	'',	'Growth habit semi erect, foliage colour dark green, Grain colour amber',	'Entire state',	'Terminal heat stress along with high resistance to stem and leaf rusts.',	'2022-03-22 11:14:12.34233',	'mJCa4YTg8k.webp,',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(149,	17,	'Maharashtra',	'UAS-428 (2012)',	'40',	'',	'100-108',	'17-19',	'80-90',	'medium broad drooping green and waxy  leaves, mediun length, semi-hard and round amber colour grain.',	'Entire state',	'high tolerance towards rust.',	'2022-03-22 11:24:52.197656',	'7nxwJ9EEkW.jpeg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(141,	17,	'Maharashtra',	'HD-2189 (1976)',	'40',	'',	'120-125',	'14-16',	'',	'Drought growth habit, erect, stem & foliage dark green colour, good bread quality.',	'Entire state',	'high tolerance towards rust.',	'2022-03-22 04:58:17.175502',	'1TpDymnreS.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(191,	17,	'Madhya Pradesh',	'JW 1201',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'bold grain, good appearance and high protein content',	'suitable for irrigated condition of Madhya Pradesh',	'Tolerant  to Drought',	'2022-04-07 05:40:18.508264',	'',	39,	40,	115,	120,	20,	21,	0,	0),
(192,	17,	'Madhya Pradesh',	'MP 3269 (2010)',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Grains bold and sarbati',	'suitable for partially irrigated condition of Madhya Pradesh',	'Tolerant to drought and rusts',	'2022-04-07 06:00:48.692568',	'',	0,	40,	0,	0,	17,	18,	0,	0),
(193,	17,	'Madhya Pradesh',	'MP 3336',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'bold grain, good appearance and high protein content',	'suitable for irrigated condition of Madhya Pradesh',	'Tolerant to  rust',	'2022-04-07 06:03:06.187142',	'',	0,	40,	115,	120,	20,	21,	0,	0),
(194,	17,	'Madhya Pradesh',	'JW 3288',	NULL,	'Oct-Dec0',	NULL,	NULL,	NULL,	'Bold grain, non lodging and non shattering Profuse tillering',	'suitable for  Rainfed/Restricted irrigated condition',	'Tolerant to  rust',	'2022-04-07 06:04:40.403783',	'',	0,	40,	0,	0,	18,	19,	0,	0),
(195,	17,	'Madhya Pradesh',	'JW 3173',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Bold  Grain',	'suitable for partially irrigated condition of Madhya Pradesh',	'tolerant to heat Hard threshaibility ,lodging and rusts,',	'2022-04-07 06:08:17.658068',	'',	0,	40,	0,	0,	15,	17,	0,	0),
(196,	17,	'Madhya Pradesh',	'JW 3211',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'best for chapati',	'suitable for partially irrigated condition of Madhya Pradesh',	'Tolerant to drought and rusts',	'2022-04-07 06:18:08.659561',	'',	0,	40,	0,	0,	16,	18,	0,	0),
(197,	17,	'Madhya Pradesh',	'Sujata',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Tall, bold and shining grain',	'Entire state',	'Tolerant to drought and rusts',	'2022-04-07 06:19:57.127384',	'',	0,	40,	0,	0,	6,	7,	0,	0),
(198,	17,	'Madhya Pradesh',	'JW 3020',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Bold grain and long ear',	'Wheat growing areas of Madhya Pradesh',	'Resistant to lodging',	'2022-04-07 06:22:26.137889',	'',	0,	40,	0,	0,	14,	15,	0,	0),
(199,	17,	'Madhya Pradesh',	'HD 2864',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Good for chapati',	'Wheat growing areas of Madhya Pradesh',	'Terminal heat tolerant',	'2022-04-07 06:23:42.996141',	'',	0,	40,	0,	0,	18,	20,	0,	0),
(200,	17,	'Madhya Pradesh',	'JW 1202',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Bold grains and profuse tillering',	'Wheat growing areas of Madhya Pradesh',	'Terminal heat tolerant',	'2022-04-07 06:26:46.005819',	'',	0,	40,	0,	0,	18,	20,	0,	0),
(201,	17,	'Madhya Pradesh',	'JW 1203',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Bold grains and profuse tillering Rich in protein, zinc ,iron and copper,',	'Wheat growing areas of Madhya Pradesh',	'Terminal heat tolerant',	'2022-04-07 06:28:14.381373',	'',	0,	40,	0,	0,	18,	20,	0,	0),
(219,	10,	'Maharashtra',	'Manjri (Rabi)',	NULL,	'15th October to 15th November',	NULL,	NULL,	NULL,	'Suitable for Kharif and Rabi. Suitable for grain as well as fodder purpose.',	'Entire state',	'Resistant to major pests and diseases',	'2022-04-20 05:47:55.98054',	'',	6,	8,	100,	110,	20,	22,	0,	0),
(226,	10,	'Maharashtra',	'Rajarshi (Hybrid)',	NULL,	'15th June to 15th July',	NULL,	NULL,	NULL,	'Suitable for Kharif & Rabi season .High starch content.',	'Entire state',	'Resistant to Chilo partellus & Sitophilus oryzae.',	'2022-04-20 10:43:32.815755',	'',	6,	8,	95,	100,	28,	30,	0,	0),
(227,	10,	'Maharashtra',	'Rajarshi (Hybrid) (Rabi)',	NULL,	'15th October to 15th November',	NULL,	NULL,	NULL,	'Suitable for Kharif & Rabi season.High starch content',	'Entire state',	'Resistant to Chilo partellus & Sitophilus oryzae.',	'2022-04-20 10:51:06.7658',	'',	6,	8,	95,	100,	38,	40,	0,	0),
(228,	10,	'Maharashtra',	'Phule Maharshi (QMH-1025)',	NULL,	'15th June to 15th July',	NULL,	NULL,	NULL,	'Suitable for Kharif & Rabi season .It is Medium maturity',	'Entire state',	'Resistant to Turcicum leaf blight, maydis leaf blight, Banded leaf and sheath blight and charcoal rot.',	'2022-04-21 04:14:58.105211',	'',	6,	8,	95,	100,	30,	32,	0,	0),
(229,	10,	'Maharashtra',	'Phule Maharshi (QMH-1025) (Rabi)',	NULL,	'15th October to 15th November',	NULL,	NULL,	NULL,	'Suitable for Kharif & Rabi season .It is Medium maturity',	'Entire state',	'Resistant to Turcicum leaf blight, maydis leaf blight, Banded leaf and sheath blight and charcoal rot.',	'2022-04-21 04:17:12.961429',	'',	6,	8,	95,	100,	34,	36,	0,	0),
(69,	17,	'Punjab',	'PBW 757 (2020)',	'40',	'From first fortnight of January',	'114',	'16',	'82',	'',	'Entire state',	'It is resistant to yellow rust and brown rust diseases.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(18,	8,	'Punjab',	'PR 113 (1998)',	'8',	'May 20-25',	'112',	'28',	'105',	'Its grains are bold and heavy.',	'',	'Resistant to eight of the ten pathotypes of bacterial leaf blight pathogen presently prevalent in Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(19,	8,	'Punjab',	'PR 124 (2015)',	'8',	'May 25-31',	'105',	'30',	'107',	'It possesses long slender, clear translucent grains.',	'',	'Resistant to all the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(155,	8,	'Madhya Pradesh',	'Pusa Sugandh 4  (2002)',	'',	'Jun-Aug',	'120-125',	'16-18',	'',	'long, slender and fragrant grain',	'Rice growing areas of Madhya Pradesh',	'',	'2022-04-01 05:54:35.291438',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(152,	8,	'Madhya Pradesh',	'Danteshwari(2001)',	'10',	'Jun-Aug',	'90-95',	'16-20',	'',	'Small plant, medium sized seed',	'small plant, medium sized seed',	'Tolerant to Drought',	'2022-03-31 16:49:23.070214',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(153,	8,	'Madhya Pradesh',	'Pusa-1460 (2010)',	'10',	'Jun-Aug',	'120-125',	'20-22',	'',	'small plant',	'',	'',	'2022-04-01 05:30:17.601896',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(20,	9,	'Punjab',	'Punjab Basmati 7 (2021)',	'',	'First fortnight of June',	'101',	'19',	'111',	'It possesses extra-long slender grains which are soft, non-sticky and almost double upon cooking. It is highly aromatic like traditional Basmati varieties.',	'',	'It is resistant to all the ten presently prevalent pathotypes of bacterial blight pathogen in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(28,	9,	'Punjab',	'Pusa Basmati 1637 (2018)',	'',	'First fortnight of June',	'108',	'18',	'109',	'It possesses extra long slender grains.',	'',	'It is moderately tolerant to blast disease.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(27,	9,	'Punjab',	'Pusa Basmati 1718 (2019)',	'',	'First fortnight of June',	'114',	'17',	'121',	'It possesses extra long slender grains with good cooking quality',	'',	'It is resistant to all the ten pathotypes of bacterial blight presently prevalent in the Punjab state.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(26,	9,	'Punjab',	'Basmati 370',	'',	'Second fortnight of June',	'1201',	'12',	'165',	'Its grains are superfine, highly aromatic and elongate almost double upon cooking.
The cooked rice is non sticky and soft to eat.',	'',	'It is susceptible to all the pathotypes of bacterial blight pathogen prevalent in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(25,	9,	'Punjab',	'Basmati 386 (1995)',	'',	'Second fortnight of June',	'125',	'9',	'180',	'Its grains are extra-long, superfine and aromatic. 
Grains elongate almost double on cooking. 
The cooked rice is non-sticky and soft to eat',	'',	'It is susceptible to all the pathotypes of bacterial blight pathogen prevalent in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(24,	9,	'Punjab',	'Punjab Basmati 3 (2013)',	'',	'First fortnight of June',	'109',	'16',	'105',	'It possesses extra-long slender grains with tip awns which prevent bird damage. 
The grains are translucent with strong aroma, good cooking and eating quality characteristics.',	'',	'It is resistant to all the ten presently prevalent pathotypes of bacterial blight pathogen in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(23,	9,	'Punjab',	'CSR 30 (2017)',	'',	'Second fortnight of June',	'112',	'14',	'139',	'It possesses extra-long slender grains with excellent cooking and eating quality characteristics. 
The grains are non-sticky, soft to eat and highly aromatic.',	'',	'It is susceptible to all the pathotypes of bacterial blight presently prevalent in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(22,	9,	'Punjab',	'Punjab Basmati 4 (2017)',	'',	'First fortnight of June',	'116',	'17',	'96',	'The grains are extra-long slender with excellent cooking and eating quality characteristics. 
The grains double upon cooking and are non-sticky & aromatic.',	'',	'It is resistant to all the ten pathotypes of bacterial blight pathogen presently prevalent in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(21,	9,	'Punjab',	'Punjab Basmati 5 (2017)',	'',	'First fortnight of June',	'107',	'15',	'112',	'It possesses extra-long slender grains with excellent cooking and eating quality characteristics.
The grains almost double upon cooking and are non-sticky & highly aromatic.',	'',	'It is resistant to all the ten pathotypes of bacterial blight pathogen presently prevalent in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(151,	8,	'Madhya Pradesh',	'Sahbhagi (2011)',	'10',	'Jun-Aug',	'90-95',	'12-16',	'',	'small plant, medium slender grain',	'In unirrigated areas, for untied flat and lightly sloped fields and for untied flat, very light land with small ridges, in areas with low rainfall and delayed sowing.',	'Tolerant to Drought',	'2022-03-31 16:29:10.63855',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(154,	8,	'Madhya Pradesh',	'WGL-32100 (2007)',	'10',	'Jun-Aug',	'125-130',	'22-24',	'',	'Small plant',	'Irrigated eco-system',	'Tolerant to salinity',	'2022-04-01 05:42:11.756258',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(156,	8,	'Madhya Pradesh',	'Pusa Sugandh 3 (2001)',	'8',	'Jun-Aug',	'120-125',	'16-18',	'',	'Long, slender and fragrant grain',	'Rice growing areas of Madhya Pradesh',	'',	'2022-04-01 06:36:09.045592',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(202,	17,	'Madhya Pradesh',	'JW 1142',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Good for chapati',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust',	'2022-04-07 06:29:28.09342',	'',	0,	40,	0,	0,	22,	24,	0,	0),
(203,	17,	'Madhya Pradesh',	'GW 273',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Good for chapati',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust  and Ug 99,',	'2022-04-07 06:30:32.108423',	'',	0,	40,	0,	0,	22,	24,	0,	0),
(204,	17,	'Madhya Pradesh',	'GW 322',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'',	'Wheat growing areas of Madhya Pradesh',	'',	'2022-04-07 06:31:37.389517',	'',	0,	40,	0,	0,	22,	24,	0,	0),
(205,	17,	'Madhya Pradesh',	'JW 1106',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Bold shining grain',	'',	'Tolerant to  rust',	'2022-04-07 06:33:59.659074',	'',	0,	40,	0,	0,	20,	23,	0,	0),
(206,	17,	'Madhya Pradesh',	'HI 8498',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Bold shining grain',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust',	'2022-04-07 06:35:31.617145',	'',	0,	40,	0,	0,	20,	23,	0,	0),
(207,	17,	'Madhya Pradesh',	'JW 1215',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'Bold shining grain',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust',	'2022-04-07 06:36:26.79748',	'',	0,	40,	0,	0,	20,	23,	0,	0),
(208,	17,	'Madhya Pradesh',	'C 306',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to  rust and blight',	'2022-04-07 06:46:19.325882',	'',	0,	40,	135,	140,	5,	6,	0,	0),
(209,	17,	'Madhya Pradesh',	'GW 366',	NULL,	'Oct-Dec',	NULL,	NULL,	NULL,	'',	'Wheat growing areas of Madhya Pradesh',	'Tolerant to blight and loose smut',	'2022-04-07 06:48:08.026318',	'',	0,	40,	110,	115,	22,	23,	0,	0),
(29,	9,	'Punjab',	'Pusa Basmati 1509 (2013)',	'',	'Second fortnight of June',	'95',	'16',	'92',	'It possesses extra-long slender grains with excellent cooking and eating quality characteristics.
Its grains become almost double upon cooking and are scented.
It is suitable for multiple cropping system.',	'',	'It is susceptible to all the pathotypes of bacterial blight pathogen prevalent in the State.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(31,	10,	'Punjab',	'PMH 13 (2021)',	'10',	'Last week of May to end of June',	'97',	'24',	'',	'This single cross hybrid has tall plants with medium high ear placement. Leaves are dark green and broad. Tassel is medium and open. Ears are conico-cylindrical and long with light orange flint grains.',	'',	'It is moderately resistant to maydis leaf blight, charcoal rot and maize stem borer.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(33,	10,	'Punjab',	'JC 12 (2020)',	'10',	'Last week of May to end of June',	'99',	'18',	'',	'The plants of this composite variety are medium tall in height with medium ear placement. It has medium thick stem which resists lodging and has heavy open tassel. Ears are medium long with good girth. This composite has semi-flint, yellow- orange grains.',	'kandi areas',	'Resists lodging',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(34,	10,	'Punjab',	'PMH 11 (2019)',	'10',	'Last week of May to end of June',	'95',	'22',	'',	'This single cross hybrid has tall plants and well developed root system. Stem is sturdy and green in colour. Leaves light green and broad. Tassel is open and heavy. Ears are long with dark orange flint grains.',	'',	'',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(35,	10,	'Punjab',	'PMH 1 (2005)',	'10',	'Last week of May to end of June',	'95',	'21',	'',	'This single cross hybrid has tall plants with well developed root system. The stem is zig-zag, sturdy and purple colored. The leaves are medium broad. Tassel is open and medium in size. Ears are medium long with yellow orange flint grains.',	'',	'',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(36,	10,	'Punjab',	'Parbhat (1987)',	'10',	'Last week of May to end of June',	'95',	'18',	'',	'This composite has medium thick stem which resists lodging. Plant and ear height is medium tall. Husk covers are well developed. Ears are medium long and thick. The grains are medium bold, yellow-orange and semi-flint to flint.',	'',	'',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(37,	10,	'Punjab',	'JC 4 (2021)',	'10',	'Last week of May to end of June',	'90',	'13',	'',	'This composite has deep-orange and bold grains. It is tested very good for chappati quality parameters viz, taste, texture, appearance and flavour.',	'Irrigated and kandi areas',	'',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(38,	10,	'Punjab',	'Kesri (1992)',	'10',	'Last week of May to end of June',	'85',	'16',	'',	'Plant height and ear placement are medium. The ears are thick at the base, taper towards the tip and have good tip filling and husk cover.',	'',	'',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(39,	10,	'Punjab',	'PMH 2 (2005)',	'10',	'Last week of May to end of June',	'83',	'18',	'',	'Leaves are medium sized and dark green in colour. Tassel is of medium size and semi-open. Silk is of green colour. It has medium long ears. Grains are yellow orange flint with yellow caps.',	'',	'The hybrid resists lodging and is tolerant to bacterial stalk rot.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(40,	10,	'Punjab',	'Punjab Sweet Corn 1 (2008)',	'10',	'Last week of May to end of June',	'100',	'13',	'',	'The leaves are broad and tassel is open with creamish anthers. Ears are medium long and the cob colour is white. Silk colour at the time of emergence is usually creamish. Husk cover is well developed and grains are orange in colour at maturity. This variety is highly suitable to use as sweet corn on commercial basis because Its developing and immature grains in green ears possess high sugar content.',	'',	'',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(41,	10,	'Punjab',	'Pearl Popcorn (1995)',	'7',	'Last week of May to end of June',	'88',	'12',	'',	'This is a composite variety of popcorn. Its ears are long and thin and grains are small and round. The commercial value of these grains is very high.
Popping quality is very good.',	'',	'',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(42,	10,	'Punjab',	'PMH 2 (2005)-Rainfed',	'10',	'June 20 - July 7',	'82',	'17',	'',	'It has medium plant height with medium ear placement. Its leaves are medium sized and dark green. Tassel is of medium size and semi open. Silk is of green colour. Ears are medium long with orange flint grains having yellow caps. The cob colour is white.',	'',	'The hybrid resists lodging and is tolerant to bacterial stalk rot.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(43,	17,	'Punjab',	'PBW 869 (2021)',	'45',	'From 4th week of October to 4th week of November',	'158',	'23',	'101',	'It possesses bold grains and longer coleoptile.',	'Entire state',	'It is resistant to brown rust and moderately resistant to yellow rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(44,	17,	'Punjab',	'PBW 824 (2021)',	'40',	'From 4th week of October to 4th week of November',	'156',	'23',	'104',	'',	'Entire state',	'It is resistant to brown rust and moderately resistant to yellow rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(45,	17,	'Punjab',	'PBW 803 (2021)',	'40',	'From 4th week of October to 4th week of November',	'151',	'23',	'100',	'',	'South Western districts',	'It is resistant to brown rust and moderately resistant to yellow rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(46,	17,	'Punjab',	'Sunehri (PBW 766) (2020)',	'40',	'From 4th week of October to 4th week of November',	'155',	'23',	'106',	'',	'Entire state',	'It is moderately resistant to yellow rust and resistant to brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(47,	17,	'Punjab',	'PBW 1 Chapati (2020)',	'40',	'From 4th week of October to 4th week of November',	'154',	'17',	'103',	'This a premium quality bread wheat variety having excellent chapati making properties. Chapati made from it is whitish in color, sweet in taste and remains soft even after hours of cooking with good palatability and texture.',	'Entire state',	'It is moderately resistant to yellow rust and resistant to brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(48,	17,	'Punjab',	'DBW 222 (2020)',	'40',	'From 4th week of October to 4th week of November',	'152',	'22',	'103',	'',	'Entire state except sub mountainous districts',	'It is moderately susceptible to yellow rust and resistant to brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(50,	17,	'Punjab',	'HD 3226 (2020)',	'40',	'From 4th week of October to 4th week of November',	'155',	'22',	'106',	'It possesses good grain quality characteristics.',	'Entire state',	'It is resistant to yellow and brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(51,	17,	'Punjab',	'Unnat PBW 343 (2017)',	'40',	'From 4th week of October to 4th week of November',	'155',	'23',	'100',	'',	'Entire state',	'It is resistant to brown rust and moderately resistant to yellow rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(52,	17,	'Punjab',	'Unnat PBW 550 (2017)',	'45',	'From 2nd week of November to 4th week of November',	'145',	'23',	'86',	'It is an improved version of PBW 550.',	'Entire state',	'It is resistant to yellow and brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(53,	17,	'Punjab',	'PBW 1 Zn (2017)',	'40',	'From 4th week of October to 4th week of November',	'151',	'22',	'103',	'It possesses higher grain zinc concentration which is good for human health.',	'Entire state',	'It is resistant to brown rust and moderately resistant to yellow rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(57,	17,	'Punjab',	'PBW 725 (2015',	'40',	'From 4th week of October to 4th week of November',	'154',	'23',	'105',	'This variety is suitable for growing under poplar plantation.',	'Entire state',	'It is resistant to yellow and brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(58,	17,	'Punjab',	'PBW 677 (2015)',	'40',	'From 4th week of October to 4th week of November',	'157',	'22',	'107',	'This variety is suitable for growing under poplar plantation.',	'Entire state',	'It is moderately resistant to yellow and brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(59,	17,	'Punjab',	'HD 3086 (2015)',	'40',	'From 4th week of October to 4th week of November',	'156',	'23',	'96',	'',	'Entire state',	'It is susceptible to new races of yellow rust and moderately susceptible to brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(60,	17,	'Punjab',	'WH 1105 (2014)',	'40',	'From 4th week of October to 4th week of November',	'157',	'23',	'97',	'',	'Entire state',	'It is susceptible to new races of yellow rust and moderately resistant to brown rust',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(61,	17,	'Punjab',	'HD 2967 (2011)',	'40',	'From 4th week of October to 4th week of November',	'157',	'21',	'101',	'',	'Entire state except sub mountainous districts',	'It is resistant to brown rust while susceptible to new races of yellow rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(63,	17,	'Punjab',	'WHD 943 (2011)',	'40',	'From 4th week of October to 1st week of November',	'154',	'20',	'93',	'It is durum wheat (Wadanak). It has low incidence of yellow berry. It possesses desirable quality characteristics and suitability for pasta making',	'Entire state/product specific',	'It is resistant to yellow and brown rusts and less susceptible to leaf blight.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(67,	17,	'Punjab',	'PDW 291 (2005)',	'40',	'From 4th week of October to 1st week of November',	'155',	'19',	'83',	'It is durum wheat (Wadanak). It has low incidence of yellow berry and possesses suitable for pasta making.
It possesses field resistance to Karnal bunt disease.',	'Entire state/product specific',	'It is resistant to yellow and brown rusts, loose smut and flag smut and less susceptible to powdery mildew, leaf blight and head scab diseases.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(68,	17,	'Punjab',	'PBW 771 (2020)',	'40',	'From 4th week of November to 4th week of December',	'133',	'19',	'80',	'',	'Entire state',	'It is moderately resistant to yellow rust and resistant to brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(70,	17,	'Punjab',	'PBW 752 (2019)',	'40',	'From 4th week of November to 4th week of December',	'130',	'19',	'89',	'Its ears are medium dense with red glumes.',	'Entire state',	'It is resistant to yellow and brown rust.',	'2022-03-08 10:14:38.318448',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(74,	8,	'Maharashtra',	'Karjat- 1    (1987)',	'',	'Jun-July',	'110',	'40',	'70',	'Dwarf stature, short bold grain, recommend for rainfed uplands, resistant to bacterial leaf blight & moderately resistant to blast & leaf scald',	'Bacterial blight endemic pockets of the Konkan region',	'',	'2022-03-08 05:02:00.690239',	'HC9daOamOw.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(75,	8,	'Maharashtra',	'Karjat- 2  (1994)',	'',	'Jun-July',	'140',	'45',	'105',	'Dwarf stature, long slender grain, resistant to blast & neck blast, recommended for shallow, low land areas',	'Assured rainfall regions of Maharashtra',	'',	'2022-03-08 09:25:08.553732',	'M1Xq2WC2iV.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(76,	8,	'Maharashtra',	'Karjat 3  (1994)',	'',	'Jun-July',	'115',	'50',	'',	'Grains -short bold & scented.',	'',	'',	'2022-03-09 04:25:52.065788',	'my2hOMnAX3.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(77,	8,	'Maharashtra',	'Karjat 4  (1994)',	'',	'Jun-July',	'115',	'35',	'90',	'Dwarf stature, short slender, superfine grain, moderately resistant to leaf folder, suitable for rainfed upland as well as irrigated areas for kharif & rabi season',	'Konkan region',	'',	'2022-03-09 04:30:54.381461',	'KtmytIA7fG.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(78,	8,	'Maharashtra',	'Karjat-5  (2005)',	'',	'Jun-July',	'130',	'55',	'',	'Semi dwarf stature, long bold grain, resistant to neck blast, suitable for midland under rainfed & irrigated conditions',	'Rice growing areas of Maharashtra State',	'',	'2022-03-09 04:38:45.584678',	'6JW2EHVrti.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(79,	8,	'Maharashtra',	'Karjat-6  (2005)',	'',	'Jun-July',	'135',	'40',	'',	'Short slender grain, resistant to bacterial leaf blast & brown plant hopper, suitable for midland under rainfed & irrigated conditions',	'Rice growing areas of Maharashtra State',	'',	'2022-03-09 04:51:26.228012',	'UWSWh5wnhD.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(80,	8,	'Maharashtra',	'Karjat-7  (2007)',	'',	'Jun-July',	'120',	'45',	'',	'Dwarf stature, long slender grain, resistant to leaf folder, moderately to brown plant hopper, white brown plant hopper and blast and bacterial leaf blast',	'Rice growing areas of Maharashtra State',	'',	'2022-03-09 04:58:41.398592',	'h3UErDedGk.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(81,	8,	'Maharashtra',	'Karjat-8  (2010)',	'',	'Jun-July',	'145',	'40',	'',	'Short slender grain, resistant to brown plant hopper, white brown plant hopper and neck blast, suitable for shallow low land area',	'Rice growing areas of Maharashtra State',	'',	'2022-03-09 05:02:09.036147',	'8g672nzsXa.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(82,	8,	'Maharashtra',	'Karjat-9  (2014)',	'',	'Jun-July',	'130',	'50',	'100',	'Dwarf stature, medium slender grain, moderate resistant to neck blast, bacterial leaf blast, brown plant hopper and white brown plant hopper',	'Rice growing areas of Maharashtra State',	'',	'2022-03-09 05:27:40.545236',	'8XBpL1mlIT.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(73,	8,	'Maharashtra',	'Karjat- 14-7   (1971)',	'',	'Jun-July',	'145',	'45',	'80',	'Semi tall stature, long slender grain, non shattering, suitable for low lying areas',	'Assured rainfall regions of Maharashtra',	'',	'2022-03-08 04:59:31.586055',	'2DWWohR0Dn.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(72,	8,	'Maharashtra',	'Karjat-184  (1971)',	'',	'Jun-July',	'105',	'35',	'85',	'Dwarf stature, medium slender grain, moderately resistant to blast and bacterial leaf blast, recommended for rainfed uplands, tolerant to leaf folder and stem borer',	'Rice growing areas of Maharashtra State',	'',	'2022-03-08 10:14:38.318448',	'bzPAT8DPZr.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(90,	8,	'Maharashtra',	'Palghar-1   (1988)',	'',	'Jun-July',	'125',	'45',	'',	'Dwarf stature, medium slender grain, moderately resistant to stem borer & blast',	'Rice growing areas of Maharashtra',	'',	'2022-03-10 05:00:16.015781',	'oT0rDVMB9y.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(91,	8,	'Maharashtra',	'Palghar-2  (2002)',	'',	'Jun-July',	'130',	'35',	'',	'Semi dwarf, Short slender grain, moderately resistant to stem borer and blast',	'Konkan region',	'',	'2022-03-10 05:04:18.222113',	'dcjZ7qZHTQ.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(92,	8,	'Maharashtra',	'Panvel-1  (1984)',	'',	'Jun-July',	'130',	'40',	'',	'Semi dwarf stature, short bold grain, resistant to blast & moderately resistant to stem borer',	'Coastal saline soils of Konkan region',	'',	'2022-03-10 05:10:37.000409',	'gnK8tDaQaB.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(94,	8,	'Maharashtra',	'Panvel-3 (2000)',	'',	'Jun-July',	'130',	'50',	'',	'Mid tall stature, short bold grain, moderately resistant to blast',	'Coastal saline soils of Konkan region',	'',	'2022-03-10 05:27:57.054351',	'bMb5IgUhO3.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(93,	8,	'Maharashtra',	'Panvel-2  (1987)',	'',	'Jun-July',	'115',	'41',	'105',	'Semi dwarf stature, long slender grain, resistant to blast & moderately, resistant to stem borer',	'Coastal saline soils of Konkan region',	'',	'2022-03-10 05:22:21.187655',	'AskS22rG1Z.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(85,	8,	'Maharashtra',	'Sahyadri-2 (Hybrid 2004)',	'',	'Jun-July',	'120',	'65',	'110',	'Semi dwarf stature, long slender grain, resistant to falsesmut, suitable for uplands & double crop areas in the state',	'Rice growing areas of Maharashtra State',	'',	'2022-03-09 09:23:38.724264',	'eGrVnJQOd0.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(87,	8,	'Maharashtra',	'Sahyadri-3 (Hybrid-2005)',	'',	'Jun-july',	'130',	'75',	'120',	'Resistant to neck blast, moderately resistant to BLB, brown spot, sheath blight and sheath rot.',	'Rice growing areas of Maharashtra',	'',	'2022-03-09 09:47:05.017526',	'nFRY2aQLdJ.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(231,	8,	'Tamil Nadu',	'IR 64',	NULL,	'April - January',	NULL,	NULL,	NULL,	'Long slender grains',	'',	'',	'2022-04-22 07:21:51.244311',	'',	0,	0,	115,	120,	2000,	2500,	0,	0),
(89,	8,	'Maharashtra',	'Sahyadri-5 (Hirkani  2010)',	'',	'Jun-July',	'145',	'66',	'',	'Semi dwarf stature, long slender grain, moderately resistant to leaf blast, neck blast & bacterial leaf blast, tolerant to brown plant hoppers, white brown plant hoppers, green leaf hoppers & stem borer',	'Rice growing areas of Maharashtra',	'',	'2022-03-09 10:50:20.307722',	'6MVLkOts3W.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(83,	8,	'Maharashtra',	'Karjat- 10',	'',	'Jun-July',	'145',	'52',	'0',	'Non-shattering, Responsive to fertilizer, Long slender grain type. Dwarf stature & non-lodging.',	'Rice growing areas of Maharashtra State',	'',	'2022-03-09 06:12:54.122759',	'aweqFgaLnj.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(88,	8,	'Maharashtra',	'Sahyadri-4 (Hybrid 2006)',	'',	'Jun-July',	'120',	'65',	'100-105',	'Moderately resistant to leaf blast, neck blast, brown spot & rice tungro virus.',	'Rice growing areas of Maharashtra State. Irrigated plains of Hariyana and Punjab West Bengal and Uttar Pradesh in transplanted conditions',	'',	'2022-03-09 10:48:27.879483',	'xFfW1PsALi.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(232,	8,	'Tamil Nadu',	'CO 47',	NULL,	'April - January',	NULL,	NULL,	NULL,	'Medium slender grains',	'',	'Resistant to Blast',	'2022-04-22 07:25:47.614073',	'',	0,	0,	110,	115,	2000,	2400,	0,	0),
(233,	8,	'Tamil Nadu',	'ADT 36',	NULL,	'April - January',	NULL,	NULL,	NULL,	'Medium grains',	'',	'Resistant to Blast and Brown Plant Hopper',	'2022-04-22 07:28:06.821226',	'',	0,	0,	105,	110,	1500,	1700,	0,	0),
(106,	8,	'Maharashtra',	'Ratnagiri 6(2017)',	'',	'Jun-July',	'125',	'45',	'110',	'Medium slender grain type.Resistant to stem borer, leaf folder and moderately resistant to gall midge.',	'Rice growing areas of Maharashtra',	'',	'2022-03-11 04:07:17.271226',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(107,	8,	'Maharashtra',	'Ratnagiri 7  (2019)',	'',	'Jun-July',	'125',	'50',	'110',	'Semi-dwarf, mid-late in duration. Short bold grain type. Non-shattering, Non-lodging',	'Rice growing areas of Maharashtra',	'',	'2022-03-11 04:14:55.889199',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(109,	8,	'Maharashtra',	'Indrayani  (1987)',	'',	'Jun-July',	'130-135',	'40-45',	'',	'Semi dwarf , grains: LS, scented, moderately susceptible to BLB & leaf scald, resistant to blast and major pests',	'Rice growing areas of western Maharashtra',	'',	'2022-03-14 05:14:13.676669',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(111,	8,	'Maharashtra',	'Pawana (1988)',	'',	'Jun-July',	'115-120',	'35-40',	'100-105',	'Semi dwarf, grains: LS, scented,  resistant to blast, moderately resistant to leaf scald, tolerant to major pests',	'Rice growing areas of western Maharashtra',	'',	'2022-03-14 06:00:19.962392',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(114,	8,	'Maharashtra',	'Kundalika  (1988)',	'',	'Jun-July',	'115-120',	'35-40',	'',	'short slender, resistant to blast & major pest',	'Rice growing areas of Maharashtra',	'',	'2022-03-14 06:47:58.841899',	',',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(161,	8,	'Madhya Pradesh',	'JRH-4(Hybrid) (2007)',	'10',	'Jun-Aug',	'110-115',	'26-28',	'',	'Long slender grain',	'Suitable for double cropping in Madhya Pradesh',	'',	'2022-04-02 16:42:01.577388',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(100,	8,	'Maharashtra',	'Ratnagiri 1 (1986)',	'',	'Jun-July',	'115',	'50',	'100',	'Long bold grain, moderately resistant to blast and neck blast, internationally released in Zambia for irrigated ecology',	'Rice growing areas of Maharashtra',	'',	'2022-03-10 06:34:24.84038',	'G4gANU7adm.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(162,	8,	'Madhya Pradesh',	'JRH-5(Hybrid) (2008)',	'10',	'Jun-Aug',	'100-105',	'26-28',	'',	'Medium Slender Grain',	'Suitable for double cropping under rainfed situation (Rice-Gram or Rice-Oilseed)',	'',	'2022-04-03 15:40:41.751334',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(95,	8,	'Maharashtra',	'Ratnagiri 24   (1971)',	'',	'Jun-july',	'95-105',	'35-40',	'',	'Semi dwarf stature, long slender grain, tolerant to stem borer, suitable for both kharif and hot weather, resistant to blast and moderately, susceptible to bacterial leaf blight',	'Rice growing areas of Maharashtra',	'',	'2022-03-10 05:30:56.359807',	'OcdSdtjA7O.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(102,	8,	'Maharashtra',	'Ratnagiri 3 (1991)',	'',	'Jun-July',	'145',	'50',	'',	'Grains - long bold, resistant to blast , BLB & tolerant to GM.',	'Assured rainfall regions of Maharashtra',	'',	'2022-03-10 09:21:31.293957',	'PoCxzPdYtg.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(104,	8,	'Maharashtra',	'Ratnagiri 5 (2014)',	'',	'Jun-July',	'120',	'36',	'90',	'Short slender grain, moderately resistant to leaf blast, neck blast and bacterial leaf blight',	'Assured rainfall regions of Maharashtra',	'',	'2022-03-11 04:00:55.805956',	'8tva42CXwf.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(103,	8,	'Maharashtra',	'Ratnagiri 4 (2009)',	'',	'Jun-July',	'130',	'49',	'',	'Long slender grain, moderately resistant to neck blast, leaf blast & bacterial leaf blight',	'Konkan and W. Maharashtra region',	'',	'2022-03-10 11:09:55.148433',	'AdWFo7JQMZ.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(98,	8,	'Maharashtra',	'Ratnagiri 68-1 (1975)',	'',	'Jun-July',	'145',	'50',	'',	'Semi dwarf stature, long bold grain, resistant to bacterial leaf',	'Rice growing areas of Maharashtra',	'',	'2022-03-10 06:03:28.623595',	'hiCFzIVltQ.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(99,	8,	'Maharashtra',	'Ratnagiri 73-1 (1979)',	'',	'Jun-July',	'98',	'40',	'',	'Semi dwarf stature, long slender grain, suitable for light & medium type soils, suitable for both kharif and hot weather conditions, can be grown under dibbled and transplanted conditions',	'Rice growing areas of Maharashtra',	'',	'2022-03-10 06:14:31.810247',	'eSmQUdndRZ.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(177,	8,	'Meghalaya',	'Ranjit',	'17',	'June to first week of July',	'160',	'60',	'',	'',	'Lowland: Low altitude (below 800m)',	'',	'2022-04-05 07:27:28.038899',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(101,	8,	'Maharashtra',	'Ratnagiri 2 (1986)',	'',	'Jun-July',	'150',	'18-20',	'105',	'Short bold grain, resistant to blast & neck blast',	'low land rice growing areas having assured rainfall in Maharashtra.',	'',	'2022-03-10 08:56:26.170233',	'tnr7cIFoQv.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(108,	8,	'Maharashtra',	'Phondaghat 1 (2000)',	'',	'Jun-july',	'115-120',	'45-55',	'',	'Dwarf stature, long slender grain, resistant to blast',	'Rice growing areas of Maharashtra',	'',	'2022-03-14 04:42:37.058273',	'63jOxArQhk.png',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(157,	8,	'Madhya Pradesh',	'MTU-1010 (2000) (Cottondora Sannalu)',	'10',	'Jun-Aug',	'110-115',	'20-22',	'',	'Medium bold,slender plant',	'Rice growing areas of Madhya Pradesh',	'',	'2022-04-01 08:59:26.010168',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(163,	8,	'Madhya Pradesh',	'JRH-8(Hybrid) (2009)',	'10',	'Jun-Aug',	'95-100',	'24-26',	'',	'Medium Slender Grain',	'Early maturing, Suitable for double cropping under rainfed situation (Rice-Gram or Rice-Oilseed)',	'Tolerant  to Drought',	'2022-04-04 04:33:39.876967',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(165,	8,	'Madhya Pradesh',	'JRH-12(Hybrid)',	'10',	'Jun-Aug',	'85-90',	'26-28',	'',	'Grain Medium bold',	'Early maturing, Suitable for double cropping under rainfed situation (Rice-Gram or Rice-Oilseed)',	'Tolerant  to Drought',	'2022-04-04 05:06:04.034568',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(164,	8,	'Madhya Pradesh',	'Sahyadri(hybrid) (1998)',	'10',	'Jun-Aug',	'125-130',	'24-26',	'114-119',	'Long Slender Grain',	'Rice growing areas of Madhya Pradesh',	'Tolerant to Rice  blast & leaf scald',	'2022-04-04 04:40:33.911853',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(166,	8,	'Madhya Pradesh',	'JRH-13(Hybrid)',	'10',	'Jun-Aug',	'85-90',	'24-26',	'',	'Grain Medium bold',	'Suitable for double cropping under rainfed situation (Rice-Gram)',	'Tolerant  to Drought',	'2022-04-04 05:45:47.538305',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(167,	8,	'Madhya Pradesh',	'JRH-15(Hybrid)',	'10',	'Jun-Aug',	'85-90',	'24-26',	'',	'Grain long Slender',	'Suitable for double cropping under rainfed situation (Rice-Gram)',	'Tolerant  to Drought',	'2022-04-04 05:48:11.305648',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(168,	8,	'Madhya Pradesh',	'JRH-19(Hybrid)',	'10',	'Jun-Aug',	'100-105',	'24-26',	'',	'Grain medium Slende',	'Suitable for double cropping under rainfed situation (Rice-Gram)',	'Tolerant  to Drought',	'2022-04-04 05:49:50.159837',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(159,	8,	'Madhya Pradesh',	'IR36(1982)',	'10',	'Jun-Aug',	'120-125',	'18-20',	'',	'long slender grain',	'Entire state',	'Resistant to Bacterial Bligh',	'2022-04-01 09:24:37.309397',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(158,	8,	'Madhya Pradesh',	'IR64(1991)',	'10',	'Jun-Aug',	'125-130',	'20-22',	'100-105',	'long slender grain',	'Entire state',	'Resistant to Bacterial Bligh',	'2022-04-01 09:18:08.388538',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(169,	8,	'Madhya Pradesh',	'IR-89 (1978)',	'10',	'Jun-Aug',	'130-140',	'20-22',	'80-85',	'long Slender grain',	'Rice growing areas of Madhya Pradesh',	'to blast, GLH, moderately susceptible to RTV and susceptible to GM',	'2022-04-04 10:52:10.579797',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(170,	8,	'Madhya Pradesh',	'Karishma',	'10',	'Jun-Aug',	'125-130',	'14-16',	'',	'Medium Slender Grain',	'Suitable for  rainfed or Irrigated situation',	'Resistant to Rice  blast',	'2022-04-05 05:16:06.054316',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(171,	8,	'Madhya Pradesh',	'Ratna',	'10',	'Jun-Aug',	'130-135',	'18-20',	'85-90',	'long slender grain',	'Suitable for  Upland and direct seeded',	'Resistant to Rice blast',	'2022-04-05 06:08:43.212402',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(172,	8,	'Madhya Pradesh',	'Safri-17',	'10',	'Jun-Aug',	'140-145',	'12-14',	'',	'',	'Suitable for  rainfed or Irrigated situation',	'Resistant to Blast',	'2022-04-05 06:10:37.925742',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(173,	8,	'Madhya Pradesh',	'Lalloo-14',	'10',	'Jun-Aug',	'95-100',	'24-26',	'145-150',	'Medium Slender Grain',	'Suitable for  rainfed situation',	'',	'2022-04-05 06:32:24.683663',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(174,	8,	'Madhya Pradesh',	'Rasi (IET-1444)',	'10',	'Jun-Aug',	'120-125',	'20-22',	'90-95',	'Medium Slender Grain',	'Suitable for  rainfed(upland  Areas) situation',	'Resistant to Rice blast  & RTV',	'2022-04-05 06:36:17.783491',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(175,	8,	'Madhya Pradesh',	'Kranti',	'10',	'Jun-Aug',	'120-125',	'20-22',	'125-130',	'Short Bold Grain',	'Suitable for  Early Irrigated',	'',	'2022-04-05 06:39:01.264046',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(176,	8,	'Madhya Pradesh',	'Jawahar Rice 3-45 (IET-13623)',	'10',	'Jun-Aug',	'80-95',	'8-10',	'',	'Long Bold Grain',	'Suitable for  rainfed situation',	'Resistant to Rice blast',	'2022-04-05 06:42:19.643856',	'',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);



DROP TABLE IF EXISTS "weed";
DROP SEQUENCE IF EXISTS weed_id_seq;
CREATE SEQUENCE weed_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."weed" (
    "crop_id" integer NOT NULL,
    "state" character varying NOT NULL,
    "name" character varying NOT NULL,
    "measures" character varying,
    "id" integer DEFAULT nextval('weed_id_seq') NOT NULL,
    CONSTRAINT "weed_pkey" PRIMARY KEY ("state", "crop_id", "name"),
    CONSTRAINT "id" FOREIGN KEY (crop_id) REFERENCES crop(id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "weed" ("crop_id", "state", "name", "measures", "id") VALUES
(8,	'Punjab',	'Sedges and broadleaf weeds',	'For control of sedges (paddy mothas like chhatri wala dila) and broadleaf weeds including ghrilla, sanni etc, spray 30 g per acre Algrip 20 WG (metsulfuron*) or 50 g Sunrice15 WG (ethoxysulfuron) or 40 g Londex 60 DF (bensulfuron methyl) or 16 g Segment 50 DF (azimsulfuron*) or 8 g per acre Almix 20 WP (metsulfuron methyl +chlorimuron ethyl).
If the crop is infested with paddy mothas including gandi wala motha in 150 litres of water at 20 days of transplanting. 
Do not spray the herbicide in standing water and irrigation may be applied one day after spray.
The spray should be done on a clear and calm day for getting good efficacy from herbicides.
Use different group of recommended herbicides in rotation to avoid the problem of herbicide resistance in weeds.',	2),
(9,	'Punjab',	'Sedges and broadleaf weeds',	'For control of sedges (paddy mothas like chhatri wala dila) and broadleaf weeds including ghrilla, sanni etc, spray 30 g per acre Algrip 20 WG (metsulfuron*) or 50 g Sunrice15 WG (ethoxysulfuron) or 40 g Londex 60 DF (bensulfuron methyl) or 16 g Segment 50 DF (azimsulfuron*) or 8 g per acre Almix 20 WP (metsulfuron methyl +chlorimuron ethyl). If the crop is infested with paddy mothas including gandi wala motha in 150 litres of water at 20 days of transplanting. Do not spray the herbicide in standing water and irrigation may be applied one day after spray. The spray should be done on a clear and calm day for getting good efficacy from herbicides. Use different group of recommended herbicides in rotation to avoid the problem of herbicide resistance in weeds.',	3),
(10,	'Punjab',	'Mixed weed flora',	'Spray 105 ml per acre Laudis 420 SC (tembotrione) in 150 litres of water at 20 days after sowing.',	6),
(10,	'Punjab',	'Dila/Motha',	'Apply 400 ml per acre 2,4-D amine salt 58 SL as post emergence 20-25 days after sowing in 150 litres of water.',	7),
(10,	'Punjab',	'Annual grasses and broad leaf weeds',	'Spray 800 g per acre Atrataf/Atragold/Masstaf/Atari/Traxx 50 WP (atrazine) on medium to heavy textured soils and 500 g per acre in light soils within ten days of sowing, using 200 litres of water or spray 250 g per acre atrazine on 20 cm wide band over the crop rows followed by hoeing/interculture at 15 to 30 days after sowing.',	5),
(17,	'Punjab',	'Wild oats (Jangli Javi)',	'Arelon/Delron/Hilproturon/ Ronak /Nocilon/ Wonder/ Milron/Agrilon/ Totalon/ Agrilon/ Shivron/Carelon/ Marklon/Jai-roturon/ Isoguard/ Dhar/ Rakshak/ Prowl/Kanak/ Isotox/ Isohit/ Ciluron /Isocin 75 WP (isoproturon) - 300 g in light textured; 400 g in medium textured and 500 g in heavy textured soils.
Leader/SF-10/Safal/ Marksulfo 75 WG (sulfosulfuron*) - 13g.',	10),
(8,	'Maharashtra',	'broadleaf weed (pre)',	'Use Butachlor 50 EC-1200ml/acre or Thiobencarb 50EC-1200ml or Pendimethalin 30 EC-1000ml or Pretilachlor 50 EC-600ml per acre as pre-emergence herbicides, 2 to 3 days after transplanting. Mix any one of these herbicides in 60kg of sand per acre and broadcast uniformly in 4-5cm deep standing water.',	13),
(8,	'Maharashtra',	'Broadleaf weed (post)',	'apply Metsulfuron 20WP@30gm/acre in 150Ltr water as post emergence, 20-25 days after transplanting. Before spray, drained out the standing water from the field and apply irrigation one day after spray.',	14),
(17,	'Maharashtra',	'Broad leaf',	'apply Pendimethalin (Stomp 30 EC) @1 Ltr at 0-3 days before sowing in 200 litres of water/acre. Use 2, 4-D @250 ml in 150 ltr water for controlling broad leaf weeds.',	15);

-- 2022-05-05 15:07:25.299009+05:30