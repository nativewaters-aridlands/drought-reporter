library(magrittr)

leaflet::leaflet(options = leaflet::leafletOptions(zoomControl = TRUE)) %>% 
  leaflet::fitBounds(-120, 31, -109, 42) %>%
  leaflet::addMapPane("background", 
                      zIndex = 1) %>% 
  leaflet::addMapPane("middleground", 
                      zIndex = 420) %>% 
  leaflet::addMapPane("foreground", 
                      zIndex = 430) %>% 
  leaflet::addProviderTiles("Stamen.TonerBackground", 
                            options = leaflet::providerTileOptions(pane = "background", 
                                                                   attribution = "")) %>% 
  leaflet::addTiles("https://api.maptiler.com/tiles/hillshades/{z}/{x}/{y}.png?key=KZO7rAv96Alr8UVUrd4a", 
                    attribution = "", 
                    options = leaflet::tileOptions(pane = "foreground")) %>% 
  leaflet::addProviderTiles("Stamen.TonerHybrid", 
                            options = 
                              leaflet::providerTileOptions(pane = "foreground", 
                                                           attribution = "map data by <a href='https://www.openstreetmap.org/copyright' target='_blank'>OpenStreetMap</a>, map style by <a href='https://stamen.com/' target='_blank'>Stamen Design</a>")) %>% 
  leaflet::addScaleBar(position = "bottomright", 
                       options = leaflet::scaleBarOptions(metric = FALSE)) %>%
  leaflet.extras::addFullscreenControl(position = "topleft") %>% 
  leaflet::addEasyButton(leaflet::easyButton(icon = "fa-crosshairs", 
                                             title = "Locate Me", 
                                             position = "topleft", 
                                             onClick = leaflet::JS("function(btn, map){ map.locate({setView: true}); }"))) %>%

  leaflet::addWMSTiles(
    "http://ndmc-001.unl.edu:8080/cgi-bin/mapserv.exe?map=/ms4w/apps/usdm/service/usdm_current_wms.map",
    layers = "usdm_current",
    options = leaflet::WMSTileOptions(format = "image/png",
                                      transparent = TRUE),
    group = "Current Drought Conditions"
  ) %>%
  leaflet::addWMSTiles(
    "https://idpgis.ncep.noaa.gov/arcgis/services/NWS_Climate_Outlooks/cpc_drought_outlk/MapServer/WMSServer",
    layers = "1",
    options = leaflet::WMSTileOptions(format = "image/png",
                                      transparent = TRUE),
    group = "Monthly Drought Outlook"
  ) %>%
  leaflet::addWMSTiles(
    "https://idpgis.ncep.noaa.gov/arcgis/services/NWS_Climate_Outlooks/cpc_drought_outlk/MapServer/WMSServer",
    layers = "0",
    options = leaflet::WMSTileOptions(format = "image/png",
                                      transparent = TRUE),
    group = "Seasonal Drought Outlook"
  ) %>%
  # Layers control
  leaflet::addLayersControl(
    baseGroups = c("Current Drought Conditions",
                   "Monthly Drought Outlook",
                   "Seasonal Drought Outlook"
    ),
    options = leaflet::layersControlOptions(collapsed = TRUE)
  ) %>%
  leafem::addLogo(img = "https://nativewaters-aridlands.github.io/drought-reporter/nwal_symbol.png") %>%
  leafem::addMouseCoordinates() %T>%
 htmlwidgets::saveWidget("map.html",
                         title = "Drought in the West")
  
file.copy(from = "map.html", 
          to = "docs/map.html",
          overwrite = TRUE)
