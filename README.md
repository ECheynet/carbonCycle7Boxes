# A seven-box model of the carbon cycle for climate modelling 
[![View Seven-box carbon cycle model on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/128979-seven-box-carbon-cycle-model)
[![Donation](https://camo.githubusercontent.com/a37ab2f2f19af23730565736fb8621eea275aad02f649c8f96959f78388edf45/68747470733a2f2f77617265686f7573652d63616d6f2e636d68312e707366686f737465642e6f72672f316339333962613132323739393662383762623033636630323963313438323165616239616439312f3638373437343730373333613266326636393664363732653733363836393635366336343733326536393666326636323631363436373635326634343666366536313734363532643432373537393235333233303664363532353332333036313235333233303633366636363636363536353264373936353663366336663737363737323635363536653265373337363637)](https://www.buymeacoffee.com/echeynet)

A seven-box carbon cycle model is implemented in Matlab to simulate atmospheric CO2 concentration from 1750 onwards.

## Summary

The run7Box function is a simple tool to simulate the global carbon cycle. It uses a 7-box model [1] to represent different reservoirs of carbon, including the atmosphere, surface ocean, intermediate ocean, deep ocean, sediment, biosphere and soil. It incorporates emissions data from fossil fuels, land-use change and other sources, and uses this to simulate how carbon moves through the different reservoirs over time. To use the run7Box function, simply run it with the appropriate input parameters. The function will return the atmospheric carbon dioxide concentration over time. The documentation file Documentation.mlx provides detailed information on the input parameters and output of the function, as well as examples of how to use it. This is the first version of the submission and there may still be some bugs. If you have any questions, please ask!


## Content

This repository contains the following files:

- Documentation.mlx: A MATLAB Live Script that provides detailed documentation for the run7Box function.
- run7Box.m: A MATLAB function that simulates the carbon cycle using a 7-box model. It takes in emissions data and other input parameters, and returns the atmospheric carbon dioxide concentration over time.
- gamma_ourWorldInData.mat: A data file containing global carbon dioxide emissions data from fossil fuels and industry. The data is sourced from https://ourworldindata.org/grapher/global-co2-emissions-fossil-land.
- delta_ourWorldInData.mat: A data file containing global carbon dioxide emissions data from land-use change. The data is sourced from https://ourworldindata.org/grapher/global-co2-emissions-fossil-land.
- climate-change.csv. Source: https://ourworldindata.org/atmospheric-concentrations
- ipcc-scenarios.csv to implement different source of anthropogenic carbon emissions. Source: https://ourworldindata.org/explorers/ipcc-scenarios
- tsi_v02r01_yearly_s1610_e2022_c20230120.nc that contains solar irradiance time series
- T_anomaly_1850.mat, which are the global temperature anomaly w.r.t. to 1951-1980
- IPCC_scnario_plot.mlx shows some of the data contained in the csv file ipcc-scenarios.csv

## References

[1] Tomizuka, A. (2009). Is a box model effective for understanding the carbon cycle?. American Journal of
