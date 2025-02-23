import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt


guest_address = pd.read_csv('Wedding/Zip_Codes_For_Heat_Maps.csv')
guest_address['Zip'] = guest_address['Zip'].astype(str)

zip_s

print(guest_address)