import pandas as pd
import pgeocode
import folium
import matplotlib.pyplot as plt
from folium.plugins import HeatMap


def make_heatmap():

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

def make_age_piechart(csv_file):

    # Load csv
    df = pd.read_csv(csv_file)

    # Define age range size (change this value to adjust bin size)
    age_range_size = 10  # Change this to 5 for 5-year bins, 10 for 10-year bins, etc.

    # Define age bins (0-4, 5-9, ..., 95-99, 100+)
    max_age = 100 + age_range_size  # Ensures last bin includes 100+
    bins = list(range(0, max_age, age_range_size))
    labels = [f"{i}-{i+age_range_size-1}" for i in bins[:-1]]
    labels[-1] = f"{bins[-2]}+"  # Adjust last label for 100+

    # Categorize ages into bins
    df = df[df["Estimated age"] != "?"]
    df = df.dropna(subset=["Estimated age"])
    df['Estimated age'] = df['Estimated age'].astype(int)
    df["Estimated age"] = pd.cut(df["Estimated age"], bins=bins, right=False, labels=labels)

    # Count occurrences in each age group
    age_distribution = df["Estimated age"].value_counts().sort_index()
    age_distribution = age_distribution[age_distribution > 0]  # Remove empty slices

    # Plot pie chart
    plt.figure(figsize=(8, 8))
    plt.pie(age_distribution, labels=age_distribution.index, autopct="%1.1f%%", startangle=140)
    plt.title("Age Distribution of Guests")
    plt.show()
    pass

def make_job_piechart(csv_file):

    # Load csv
    df = pd.read_csv(csv_file)

    # Remove rows where Job Industry is missing or unknown
    df = df.dropna(subset=["Job Industry"])  # Remove NaN values
    df = df[df["Job Industry"] != "?"]  # Remove "?" values if they exist

    # Count occurrences of each job industry
    job_distribution = df["Job Industry"].value_counts()

    # Remove industries with zero occurrences (just in case)
    job_distribution = job_distribution[job_distribution > 0]

    # Plot pie chart
    plt.figure(figsize=(8, 8))
    plt.pie(job_distribution, labels=job_distribution.index, autopct="%1.1f%%", startangle=140)
    plt.title("Job Industry Distribution")
    plt.show()

if __name__ == "__main__":
    age_industry_csv = "Wedding\Age_&_Idustry.csv"

    # make_heatmap()
    # make_age_piechart(age_industry_csv)
    make_job_piechart(age_industry_csv)