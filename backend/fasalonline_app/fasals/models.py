# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AboutChemicalFertilizer(models.Model):
    id = models.IntegerField()
    trade_name = models.CharField(primary_key=True, max_length=1000)
    description = models.CharField(max_length=1000, blank=True, null=True)
    formulation = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    price = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'about_chemical_fertilizer'


class AboutDisease(models.Model):
    name = models.CharField(primary_key=True, max_length=1000)
    common_name = models.CharField(max_length=1000, blank=True, null=True)
    description = models.CharField(max_length=1000, blank=True, null=True)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'about_disease'


class AboutFieldPreparation(models.Model):
    type = models.CharField(primary_key=True, max_length=1000)
    description = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    procedure = models.CharField(max_length=1000, blank=True, null=True)
    id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'about_field_preparation'


class AboutNutrientDeficiency(models.Model):
    name = models.CharField(primary_key=True, max_length=1000)
    common_name = models.CharField(max_length=1000, blank=True, null=True)
    description = models.CharField(max_length=1000, blank=True, null=True)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'about_nutrient_deficiency'


class AboutOrganicManure(models.Model):
    trade_name = models.CharField(primary_key=True, max_length=1000)
    description = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'about_organic_manure'


class AboutPest(models.Model):
    name = models.CharField(primary_key=True, max_length=1000)
    common_name = models.CharField(max_length=1000, blank=True, null=True)
    description = models.CharField(max_length=1000, blank=True, null=True)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'about_pest'


class AboutRodent(models.Model):
    name = models.CharField(primary_key=True, max_length=1000)
    common_name = models.CharField(max_length=1000, blank=True, null=True)
    description = models.CharField(max_length=1000, blank=True, null=True)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'about_rodent'


class AboutSoil(models.Model):
    type = models.CharField(primary_key=True, max_length=1000)
    description = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    states = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'about_soil'


class AboutWeed(models.Model):
    name = models.CharField(primary_key=True, max_length=1000)
    common_name = models.CharField(max_length=1000, blank=True, null=True)
    description = models.CharField(max_length=1000, blank=True, null=True)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    crops = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'about_weed'


class Admin(models.Model):
    username = models.CharField(max_length=1000)
    password = models.CharField(max_length=1000)
    name = models.CharField(max_length=100, blank=True, null=True)
    fname = models.CharField(max_length=1000, blank=True, null=True)
    address = models.CharField(max_length=1000, blank=True, null=True)
    state = models.CharField(max_length=100, blank=True, null=True)
    distt = models.CharField(max_length=100, blank=True, null=True)
    email = models.CharField(max_length=1000, blank=True, null=True)
    mobile = models.BigIntegerField(blank=True, null=True)
    photo = models.CharField(max_length=1000, blank=True, null=True)
    usertype = models.CharField(max_length=100, blank=True, null=True)
    permission = models.CharField(max_length=1000, blank=True, null=True)
    createdat = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'admin'
        unique_together = (('id', 'username'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class ChemicalFertilizer(models.Model):
    crop_id = models.IntegerField()
    state = models.CharField(primary_key=True, max_length=1000)
    trade_name = models.CharField(max_length=1000)
    cycle = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()
    amount = models.CharField(max_length=1000, blank=True, null=True)
    amount_min = models.FloatField(blank=True, null=True)
    amount_max = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'chemical_fertilizer'
        unique_together = (('state', 'crop_id', 'trade_name'),)


class Climate(models.Model):
    crop = models.ForeignKey('Crop', models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    type = models.CharField(max_length=1000, blank=True, null=True)
    temperature = models.CharField(max_length=1000, blank=True, null=True)
    rainfall = models.CharField(max_length=1000, blank=True, null=True)
    humidity = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()
    temperature_min = models.FloatField(blank=True, null=True)
    temperature_max = models.FloatField(blank=True, null=True)
    rainfall_min = models.FloatField(blank=True, null=True)
    rainfall_max = models.FloatField(blank=True, null=True)
    humidity_min = models.FloatField(blank=True, null=True)
    humidity_max = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'climate'
        unique_together = (('state', 'crop'),)


class Crop(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=1000)
    description = models.CharField(max_length=1000, blank=True, null=True)
    species = models.CharField(max_length=1000, blank=True, null=True)
    category = models.CharField(max_length=1000, blank=True, null=True)
    season = models.CharField(max_length=1000, blank=True, null=True)
    botanical_name = models.CharField(max_length=1000, blank=True, null=True)
    genus = models.CharField(max_length=1000, blank=True, null=True)
    family = models.CharField(max_length=1000, blank=True, null=True)
    origin = models.CharField(max_length=1000, blank=True, null=True)
    synonym = models.CharField(max_length=1000, blank=True, null=True)
    rotations = models.CharField(max_length=1000, blank=True, null=True)
    cropimage = models.CharField(max_length=1000, blank=True, null=True)
    average_yield = models.CharField(max_length=1000, blank=True, null=True)
    yield_min = models.FloatField(blank=True, null=True)
    yield_max = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'crop'
    
    def __str__(self):
        return self.name


class CropPattern(models.Model):
    crop_id = models.IntegerField(primary_key=True)
    intercrop = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'crop_pattern'


class Disease(models.Model):
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    name = models.CharField(max_length=1000)
    type = models.CharField(max_length=1000, blank=True, null=True)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()
    common_name = models.CharField(max_length=1000, blank=True, null=True)
    disease_image = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'disease'
        unique_together = (('state', 'crop', 'name'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class FieldPreparation(models.Model):
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    type = models.CharField(max_length=1000)
    procedure = models.CharField(max_length=1000, blank=True, null=True)
    schedule = models.CharField(max_length=1000)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'field_preparation'
        unique_together = (('state', 'crop', 'type', 'schedule'),)


class NotificationData(models.Model):
    state = models.CharField(max_length=1000, blank=True, null=True)
    notification_title = models.CharField(max_length=1000, blank=True, null=True)
    notification_body = models.CharField(max_length=1000, blank=True, null=True)
    days_gap_after_sowing_min = models.IntegerField(blank=True, null=True)
    related_to_activity = models.CharField(max_length=1000, blank=True, null=True)
    days_gap_after_sowing_max = models.IntegerField(blank=True, null=True)
    cropid = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'notification_data'


class NutrientDeficiency(models.Model):
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    name = models.CharField(max_length=1000)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'nutrient_deficiency'
        unique_together = (('state', 'crop', 'name'),)


class OrganicManure(models.Model):
    crop_id = models.IntegerField()
    state = models.CharField(primary_key=True, max_length=1000)
    trade_name = models.CharField(max_length=1000)
    cycle = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()
    amount = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'organic_manure'
        unique_together = (('state', 'crop_id', 'trade_name'),)


class Pest(models.Model):
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    name = models.CharField(max_length=1000)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()
    pest_image = models.CharField(max_length=500, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pest'
        unique_together = (('state', 'crop', 'name'),)


class PortalCoreUsers(models.Model):
    username = models.CharField(max_length=200)
    password = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    created_on = models.DateField()
    last_login = models.DateField()

    class Meta:
        managed = False
        db_table = 'portal_core_users'


class Rodent(models.Model):
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    name = models.CharField(max_length=1000)
    symptoms = models.CharField(max_length=1000, blank=True, null=True)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'rodent'
        unique_together = (('state', 'crop', 'name'),)


class Soil(models.Model):
    crop = models.OneToOneField(Crop, models.DO_NOTHING, primary_key=True)
    state = models.CharField(max_length=1000)
    type = models.CharField(max_length=1000)
    water_content = models.CharField(max_length=1000, blank=True, null=True)
    ph = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()
    water_content_min = models.IntegerField(blank=True, null=True)
    water_content_max = models.IntegerField(blank=True, null=True)
    ph_min = models.FloatField(blank=True, null=True)
    ph_max = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'soil'
        unique_together = (('crop', 'state', 'type'),)


class UserInfo(models.Model):
    mobile_number = models.CharField(unique=True, max_length=1000)
    first_name = models.CharField(max_length=1000)
    last_name = models.CharField(max_length=1000, blank=True, null=True)
    state = models.CharField(max_length=1000)
    password = models.CharField(max_length=1000)

    class Meta:
        managed = False
        db_table = 'user_info'


class VarietiesInState(models.Model):
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    varieties = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'varieties_in_state'
        unique_together = (('state', 'crop'),)


class Variety(models.Model):
    #id = models.AutoField()
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(max_length=1000, blank=True, null=True)
    variety_name = models.CharField(primary_key=True, max_length=1000)
    seed_rate = models.CharField(max_length=1000, blank=True, null=True)
    sowing_time = models.CharField(max_length=1000, blank=True, null=True)
    duration = models.CharField(max_length=1000, blank=True, null=True)
    average_yield = models.CharField(max_length=1000, blank=True, null=True)
    height = models.CharField(max_length=1000, blank=True, null=True)
    features = models.CharField(max_length=1000, blank=True, null=True)
    suitable_regions = models.CharField(max_length=1000, blank=True, null=True)
    tolerant_to = models.CharField(max_length=1000, blank=True, null=True)
    added = models.DateTimeField(blank=True, null=True)
    v_image = models.CharField(max_length=1000, blank=True, null=True)
    seed_rate_min = models.IntegerField(blank=True, null=True)
    seed_rate_max = models.IntegerField(blank=True, null=True)
    duration_min = models.IntegerField(blank=True, null=True)
    duration_max = models.IntegerField(blank=True, null=True)
    average_yield_min = models.FloatField(blank=True, null=True)
    average_yield_max = models.FloatField(blank=True, null=True)
    height_min = models.FloatField(blank=True, null=True)
    height_max = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'variety'
        unique_together = (('variety_name', 'crop'),)


class Weed(models.Model):
    crop = models.ForeignKey(Crop, models.DO_NOTHING)
    state = models.CharField(primary_key=True, max_length=1000)
    name = models.CharField(max_length=1000)
    measures = models.CharField(max_length=1000, blank=True, null=True)
    #id = models.AutoField()

    class Meta:
        managed = False
        db_table = 'weed'
        unique_together = (('state', 'crop', 'name'),)
