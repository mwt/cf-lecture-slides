require(xml2)
xmltodf <- function(url) {
  # Look up Axis.Y in XML data
  mortality_xml <- xml2::xml_find_all(
    xml2::read_xml(url),
    ".//Axis//Y"
  )
  
  # Create age from "t" attribute and mortality quantile from content
  mortality <- data.frame(
    x = as.integer(xml2::xml_attr(mortality_xml,"t")) - 1,
    qx  = xml2::xml_double(mortality_xml)
  )
  
  # Save the data.frame
  mortality <<- mortality
}