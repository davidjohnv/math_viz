import pandas as pd
import pgeocode
import folium
from folium.plugins import HeatMap


# Import csv data
df = pd.read_csv('Wedding/Zip_Codes_For_Heat_Maps.csv')

# Clean up the zip data type
df['Zip'] = df['Zip'].astype(str)

# Convert ZIP codes to latitude and longitude
nomi = pgeocode.Nominatim('us')
zip_locations = df['Zip'].value_counts().reset_index()
zip_locations.columns = ['Zip', 'Count']

# Get latitude and longitude for each ZIP
zip_locations[['Latitude', 'Longitude']] = zip_locations['Zip'].apply(
    lambda x: nomi.query_postal_code(x)[['latitude', 'longitude']]
)

# Drop missing values
zip_locations = zip_locations.dropna()

# Create a map centered in the US
m = folium.Map(location=[39.8283, -98.5795], zoom_start=4)

# Prepare heatmap data with intensity
heat_data = zip_locations[['Latitude', 'Longitude', 'Count']].values.tolist()

# Add heatmap layer with weight
HeatMap(heat_data).add_to(m)

# Save map to an HTML file
m.save("Wedding\output\heatmap.html")
