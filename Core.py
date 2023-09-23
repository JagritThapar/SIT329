import pyobd
import json

# Connect to the OBD scanner
obd = pyobd.OBD()

# Get the OBD data
fuel_consumption = obd.query("015E")
transmission_temperature = obd.query("010E")
coolant_level = obd.query("0105")
brake_fluid_level = obd.query("0103")
oil_pressure = obd.query("010A")
battery_voltage = obd.query("0142")

# Create a JSON object with the OBD data
data = {
    "fuel_consumption": fuel_consumption,
    "transmission_temperature": transmission_temperature,
    "coolant_level": coolant_level,
    "brake_fluid_level": brake_fluid_level,
    "oil_pressure": oil_pressure,
    "battery_voltage": battery_voltage
}

# Store the JSON object in a file
with open("file/obd_data.json", "w") as f:
    json.dump(data, f)
