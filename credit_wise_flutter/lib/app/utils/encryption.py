# # encrypt_config_to_file.py - Run LOCALLY on your machine

# from Crypto.Cipher import AES
# from Crypto.Util.Padding import pad
# import base64
# import os

# # Define the output file name
# OUTPUT_FILENAME = 'app_config_enc.txt'

# # Your Secret Key (32 bytes = 256 bits)
# KEY = b'thisisasecretkeyforflutterapp123'
# # Your Initialization Vector (16 bytes = 128 bits). Generate a new one for production!
# IV = b'randomsalt123456'

# PLAINTEXT = '{"baseUrl": "http://$localhost:8080/"}'

# # --- Encryption Logic ---
# cipher = AES.new(KEY, AES.MODE_CBC, IV)
# padded_data = pad(PLAINTEXT.encode('utf-8'), AES.block_size)
# ciphertext = cipher.encrypt(padded_data)

# # Encode result to Base64
# encrypted_base64 = base64.b64encode(ciphertext).decode('utf-8')

# # --- File Writing Logic ---
# try:
#     with open(OUTPUT_FILENAME, 'w') as f:
#         f.write(encrypted_base64)
    
#     print(f"✅ Encryption successful!")
#     print(f"Ciphertext written to: {OUTPUT_FILENAME}")
#     print("\nRemember to place this file in your Flutter app's assets folder.")

# except IOError as e:
#     print(f"❌ Error writing to file {OUTPUT_FILENAME}: {e}")