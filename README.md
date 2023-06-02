# A seven-box model of the carbon cycle for climate modelling 
[![View Seven-box carbon cycle model on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://se.mathworks.com/matlabcentral/fileexchange/128979-seven-box-carbon-cycle-model)

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
- ipcc-scenarios.cv to implement different source of anthropogenic carbon emissions
- tsi_v02r01_yearly_s1610_e2022_c20230120.nc that contains solar irradiance time series
- T_anomaly_1850.mat, which are the global temperature anomaly w.r.t. to 1951-1980

## References

[1] Tomizuka, A. (2009). Is a box model effective for understanding the carbon cycle?. American Journal of
