import TerraYaml
import json
import os
import yaml
import argparse
from pykwalify.core import Core

########## Usage ##########
# usage: ConvertTo-TerraformVarsFile.py [-h] --parameter-file PARAMETER_FILE --schema-file SCHEMA_FILE

# optional arguments:
#   -h, --help            show this help message and exit
#   --parameter-file PARAMETER_FILE
#                         file location of the input yaml parameter file
#   --schema-file SCHEMA_FILE
#                         file location of the schema yaml file

########## Argument check ##########
parser = argparse.ArgumentParser()
#parser.add_argument("--parameter-file",type=str, help="file location of the input yaml parameter file",required=True)
parser.add_argument("--parameter-file",type=str, help="file location of the input yaml parameter file",required=False)
#parser.add_argument("--schema-file",type=str, help="file location of the schema yaml file",required=True)
parser.add_argument("--schema-file",type=str, help="file location of the schema yaml file",required=False)
args = parser.parse_args()

parameter_file = args.parameter_file
schema_file = args.schema_file

parameter_file = "Main-parameters-prd-weu.yml"
schema_file = "Main-Parameters-Schema.yml"
parameter_file = "Ipgroup-Tfparameters.yml"
schema_file = "Ipgroup-Parameters-TfSchema.yml"

########## Validate existance of input files ##########
print(f"Input parameter file is: {parameter_file}. Checking if it exists...")
try:
    parameters_check = os.path.exists(parameter_file)
    if not parameters_check:
        raise Exception('Parameter file not found.')
except Exception as e:
    print(f"The parameter file [{parameter_file}] could not be found. Make sure to include the path in the file name.")
    print(e)
    exit(1)

print(f"Input schema file is: {schema_file}. Checking if it exists...")
try:
    schema_check = os.path.exists(schema_file)
    if not schema_check:
        raise Exception('Schema file not found.')
except Exception as e:
    print(f"The schema file [{schema_file}] could not be found. Make sure to include the path in the file name.")
    print(e)
    exit(1)

########## Validate parameter file with the schema file ##########
print('Validating the parameter file using the schema file...')
c = Core(source_file=parameter_file, schema_files=[schema_file])
try:
    c.validate(raise_exception=True)
except Exception as e:
    print("An error occured during the schema validation of the parameter file:")
    print(e)
    exit(1)

########## Transform parameter file to json file ##########
print('Transforming the yaml parameter file to a TerraForm Tfvars file...')

parameter_file = "Wafpolicy-TFParameters.yml"

with open(parameter_file, 'r') as file:
    configuration = yaml.safe_load(file)

with open('terraform.tfvars', 'w') as terravar_file:
    terrafile = TerraYaml.parse_yaml(configuration, 2)
    terravar_file.write(terrafile)
    


