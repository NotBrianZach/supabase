# import json
# import re

# # Define the mapping from ENV keys to JSON keys
# env_to_json_key_mapping = {
#     'JWT_SECRET': 'local_JWT_secret',
#     'ANON_KEY': 'local_anon_key',
#     'SERVICE_ROLE_KEY': 'local_service_role_key',
#     # Add other mappings here as necessary
# }

# def load_env_file(filepath):
#     """Load the .env file and return a dictionary of the environment variables."""
#     env_vars = {}
#     with open(filepath, 'r') as file:
#         for line in file:
#             match = re.match(r'^\s*([\w_]+)\s*=\s*(.*)\s*$', line)
#             if match:
#                 key, value = match.groups()
#                 env_vars[key] = value
#     return env_vars

# def update_json_with_env(json_filepath, env_vars):
#     """Update the JSON file with values from the environment variables dictionary."""
#     with open(json_filepath, 'r') as file:
#         data = json.load(file)

#     # Update the JSON data with the environment variables
#     for env_key, json_key in env_to_json_key_mapping.items():
#         if env_key in env_vars and json_key in data:
#             data[json_key] = env_vars[env_key]

#     # Write the updated JSON data back to the file
#     with open(json_filepath, 'w') as file:
#         json.dump(data, file, indent=2)

# # Load the environment variables from the .env file
# env_vars = load_env_file('./.env')

# # Update the JSON file with the environment variables
# update_json_with_env('../../woofs_projects/dec', env_vars)

# print("JSON file has been updated with values from the .env file.")
import json
import re

def load_env_file(filepath):
    """Load the .env file and return a dictionary of the environment variables."""
    env_vars = {}
    with open(filepath, 'r') as file:
        for line in file:
            # Match only non-comment lines
            match = re.match(r'^\s*([^\s#]+)\s*=\s*(.*?)\s*$', line)
            if match:
                key, value = match.groups()
                env_vars[key] = value
    return env_vars

def update_json_with_env(json_filepath, env_vars):
    """Update the JSON file with all environment variables."""
    with open(json_filepath, 'r') as file:
        data = json.load(file)

    # Iterate over all environment variables
    for env_key, env_value in env_vars.items():
        # Check if this env_key matches any key in the JSON, considering possible prefixes
        # for json_key in data.keys():
            # if json_key.endswith(env_key) or json_key == env_key:
                data[env_key] = env_value
                # break  # Stop looking for a match in this JSON once found

    # Write the updated JSON data back to the file
    with open(json_filepath, 'w') as file:
        json.dump(data, file, indent=4, sort_keys=True)

# Paths to your files
env_file_path = './.env'
json_file_path = '../../woofs_projects/dec'

# Load the environment variables from the .env file
env_vars = load_env_file(env_file_path)

# Update the JSON file with the environment variables
update_json_with_env(json_file_path, env_vars)

print("JSON file has been updated with environment variables.")
