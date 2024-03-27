import webbrowser

# Define the URLs for each service's monitoring endpoint
service_urls = [
    "http://localhost:8186",  # Studio
    "http://localhost:8000",  # Kong
    "http://localhost:3000",  # REST
    "http://localhost:5000/status",  # Storage
    "http://localhost:4000/health",  # Analytics
]

# Open each service URL in a new browser tab
for url in service_urls:
    webbrowser.open_new_tab(url)
