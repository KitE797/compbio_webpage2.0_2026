

### Load packages:

import json
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go

### load data here:
gap = px.data.gapminder().query("year==2007")

gap.head()


fig = px.choropleth(
    gap,
    locations = "iso_alpha",
    color = "lifeExp",
    hover_name = "country",
    color_continuous_scale = "Viridis",
    title = "Life Expectency By Country (2007)"
)
fig.show()

# crop this map and improve labels

fig.update_layout(
    coloraxis_colorbar_title = "Years",
    margin = dict(l=0, r=0, t=50, b=0)
)




# gdp with more hovering information

fig = px.choropleth(
    gap,
    locations = "iso_alpha",
    color = "gdpPercap",
    hover_name = "country",
    hover_data = {
        "lifeExp":":1f",
        "pop":":,",
        "gdpPercap":":,.0f",
        "iso_alpha":False
    },
    color_continuous_scale="Plasma",
    title = "GDP per capita by country (2007)"
)

fig.show()

fig.update_geos(
    showframe = False,
    showcoastlines = False
)


# crop map to one region

americas = gap.query("continent == 'Americas'")


fig = px.choropleth(
    americas,
    locations = "iso_alpha",
    color = "lifeExp",
    hover_name = "country",
    color_continuous_scale = "Tealgrn",
    title = "Life Expectency in the Americas (2007)"
)


fig.update_geos(
    scope = "north america",
    showland = True,
    landcolor = "rgb(240,240,240)"
)

# look at some projections
fig.update_geos(
    projection_type="globe"
)

# tile based choropleths

from urllib.request import urlopen

with urlopen("https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json") as response:
    county_geojson = json.load(response)

county_df = pd.read_csv(
    "https://raw.githubusercontent.com/plotly/datasets/master/fips-unemp-16.csv",
    dtype={"fips": str}
)

county_df.head()



fig = px.choropleth_map(
    county_df,
    geojson=county_geojson,
    locations="fips",
    featureidkey="id",
    color="unemp",
    color_continuous_scale="Viridis",
    zoom=3,
    center={"lat": 37.8, "lon": -96},
    map_style="open-street-map",
    opacity=0.7,
    title="US county unemployment"
)
fig.show()


######################################
### Class 4/9/26

import json
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go


eq = pd.read_csv(
    "https://raw.githubusercontent.com/plotly/datasets/master/earthquakes-23k.csv"
)
eq.head()

fig = px.density_map(
    eq,
    lat = "Latitude",
    lon = "Longitude",
    z = "Magnitude",
    radius = 5,
    zoom = 0,
    center = {"lat": 0, "lon": 180},
    map_style = "open-street-map",
    title = "Global Earthquake Density"
)

fig.update_traces(
    opacity = 0.5
)
fig.show()


pacific = eq.query("Latitude > -60 and Latitude < 60 and Longitude > 100")

fig2 = px.density_map(
    pacific,
    lat = "Latitude",
    lon = "Longitude",
    z = "Magnitude",
    radius = 5,
    zoom = 0,
    center = {"lat": 0, "lon": 180},
    map_style = "open-street-map",
    title = "Global Earthquake Density"
)

fig2.show()

gap = px.data.gapminder().query("year==2007")




df = px.data.gapminder()

fig = px.scatter_geo(
    df,
    locations = "iso_alpha",
    color = "continent",
    hover_name = "country",
    size = "pop",
    animation_frame = "year",
    projection = "lagrange"
)

fig.show()





from dash import Dash, dcc, html

app = Dash()

app.layout = html.Div([
    dcc.Graph(
        figure = fig
    )
])



app.run(
    debug = True,
    use_reloader = False
)