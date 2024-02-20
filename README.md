# zombie-survival-spain
What locations in Spain would have the highest survival rate in case of a zombie apocalypse 

## Data:
-- Population density (INE) - we hypothesize that in areas with higher population density, the R0 value (transmision rate) would be greater due to the increased likelihood of human encounters and potential exposures to the virus.

-- Farming surface (INE)

-- Cattle (INE)

-- Use of renewable energies (superficie solar instalada - por comunidad autónoma) -- https://informesweb.idae.es/informe-estadistico/informe.php 

-- Access to water (https://www.seprem.es/presases.php) -- presas y embalses en españa (hay que hacer scrapping)

-- N. farmacies per capita

-- Envejecimiento de la población (serán menos peligrosos como zombies)

-- Supermercados

-- Fábricas de conservas


A nivel estadístico, check si hay diferencia significativa entre comunidades/provincias. Esto tendría sentido?

## Parámetros

1) Probability of being infected based on population density:

calculates the probability of a human contracting the virus based on the population density and the estimated transmission rate (R0).

You can use the following equation to estimate the probability of a human contracting the virus:

[ P = 1 - e^{-R_{0} \times D} ]

Where:

( P ) is the probability of a human contracting the virus.
( R_{0} ) is the estimated basic reproduction number (transmission rate).
( D ) is the population density.
In this equation, ( e ) is the base of the natural logarithm (approximately equal to 2.71828). By combining the estimated R0 value and the population density into the equation, you can calculate the probability of a human contracting the virus in a given area.

The probability is calculated based on the assumption that the virus transmission follows an exponential distribution in a population with a specific density, as captured by the term ( e^{-R_{0} \times D} ).

R0 will also be based in population density, assuming:

- Interaction Frequency: With higher population density, individuals are likely to have more frequent interactions with others in their immediate vicinity. This increases the chances of the virus spreading through bites.

- Transmission Efficiency: Given the aggressive nature of the zombie virus transmission (through bites leading to infection), a higher population density could lead to a higher transmission efficiency, meaning that each interaction is more likely to result in transmission.

- Spatial Constraints: In densely populated areas, individuals may have less personal space and be in close proximity to others more often, thereby increasing the likelihood of virus transmission.

R0 = C\times D --- Where D is population density and C is a constant representing the infectiousness of the virus. For reference, flu is 1.3, measles is 12-18. We are picking 8 given that every human is susceptible of contracting the virus, there is no recovery and once bitten you are infected with a 100% probability.
