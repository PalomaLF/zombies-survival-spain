![Imagen_1](https://github.com/PalomaLF/zombies-survival-spain/assets/156684365/87b64ae8-e65a-4e1d-95c9-3f37ffbaa4d4)

# How to survive an Apocalypse 🧟‍♀️ (made in Spain)
_This project was made as part of IronHack's Data Analytics bootcamp_

I know, it sounds like an idea taken out of a sci-fy movie. 

However, we have already lived one global pandemic and the world is becoming crazier ever since. The goal of this project is to find what locations in Spain would have the highest survival rate in a scenario where a deathly virus changes our lives beyond recognition, call it zombie apocalyse, bio war or new mutant covid-X (we will keep calling it 'zombie apocalypse' though, it just makes it funnier 😎)

## Summary

The study focuses only on Spain. Sorry, but this is were I live 🤷🏽‍♀️ and there are already enough movies to show us this scenario would look like in the US. If you want to want to replicate it using your ouwn country data, feel free!

To find out the best locations to survive, I focused first on population density, taking this as the main variable for infection probability. Later on, I will analyze data relevant not only to avoid infection, but to best survive in this scenario (access to food, water, energy, etc.)

You will find the raw data and the final clean data in the data folder, and all jupiter notebooks used to dowloand, scrap, clean and process data in the notebooks folder. Finally, all this data has been used to create a visualization on Tableau, where you can see the best locations by Comunidad Autónoma or Provincia, and even look up your own village to check your survival probability.

I hope you like it!


## Data

To calcualte the infection probability I used the following equation:

P = 1 - e^(-R0 * D)

Where:

P: probability of a human contracting the virus.
R0: estimated basic reproduction number (transmission rate).
D: population density.
e: base of the natural logarithm (approximately equal to 2.71828)

The probability is calculated based on the assumption that the virus transmission follows an exponential distribution in a population with a specific density, as captured by the term e^(-R0 * D).

R0 will also be based in population density, assuming:

- Interaction Frequency: With higher population density, individuals are likely to have more frequent interactions with others in their immediate vicinity. This increases the chances of the virus spreading through bites.

- Transmission Efficiency: Given the aggressive nature of the zombie virus transmission (through bites leading to infection), a higher population density could lead to a higher transmission efficiency, meaning that each interaction is more likely to result in transmission.

- Spatial Constraints: In densely populated areas, individuals may have less personal space and be in close proximity to others more often, thereby increasing the likelihood of virus transmission.

To calculate R0 I used the following equation:

R0 = C * D

D: population density
C: constant representing the infectiousness of the virus. For reference, flu is 1.3, measles is 12-18. We are setting on 5 given that every human is susceptible of contracting the virus, there is no recovery and once bitten you are infected with a 100% probability.

_Reminder: this is a 100% for-fun and hypothetical scenario, that's why we are guessing and making assumtions._

Data sources:

-- Population by city/village in 2023 (INE)
-- City/village surface (#15M)


## Next steps

For next iterations of this project, I analyze data relevant not only to avoid infection, but to ensure survival, such as:

-- Farming surface (INE)
-- Cattle (INE)
-- Access to renewable energies (mainly solar) https://informesweb.idae.es/informe-estadistico/informe.php 
-- Access to water (https://www.seprem.es/presases.php)
-- N. farmacies per capita
-- Population aging (our theory is that elderly would be less dangerous once they )
-- Supermarkets and canned food factories (quick access to food on early stages of pandemics)

