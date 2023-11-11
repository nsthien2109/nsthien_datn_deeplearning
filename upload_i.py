import cloudinary
from cloudinary.uploader import upload
from cloudinary.exceptions import Error
import os

cloudinary.config(
    cloud_name="dmzvudfg5",
    api_key="614921592645376",
    api_secret="L98LhofuulpSFiErE_pB0G8in_g",
    secure=True,
)
import os

def upload_images_from_folder(local_folder, cloudinary_folder):
    for subdir, dirs, files in os.walk(local_folder):
        for file in files:
            file_path = os.path.join(subdir, file)
            try:
                # Calculate the relative path within the local folder structure
                relative_path = os.path.relpath(file_path, local_folder)
                
                # Construct the Cloudinary public_id with the desired folder structure
                public_id = f"{cloudinary_folder}/{relative_path.replace(os.path.sep, '/')}"
                
                response = upload(file_path, public_id=public_id)
                print(f"Uploaded {file_path} to {response['secure_url']}")
            except Error as e:
                print(f"Error uploading {file_path}: {e}")

local_folder = 'C:\\Users\\thien\\Downloads\\birds\\test'
cloudinary_folder = 'birds_upload'

upload_images_from_folder(local_folder, cloudinary_folder)
