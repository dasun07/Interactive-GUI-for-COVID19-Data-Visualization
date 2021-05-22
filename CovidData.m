classdef CovidData < handle
    properties
        Country                 %Name of the country
        State                   %Name of the state
        CumulativeCases         %Cumulative number of cases
        CumulativeDeaths        %Cumulative number of deaths
        DailyCases              %Daily number of cases
        DailyDeaths             %Daily number of deaths
    end
    methods
        %Constructing the country object with the above properties
        function obj = CovidData(country, state, cases, deaths)
            obj.Country = country;
            obj.CumulativeCases = cases;
            obj.CumulativeDeaths = deaths;
            if isempty(state)
                obj.State = 'All';
            else
                obj.State = state;
            end
            obj.DailyCases = cases(1);
            obj.DailyDeaths = deaths(1);
            for ii = 2:length(cases)
                dailycases  = max([0, cases(ii)-cases(ii-1)]);
                dailydeaths = max(0, deaths(ii)-deaths(ii-1));
                obj.DailyCases = [obj.DailyCases, dailycases];
                obj.DailyDeaths = [obj.DailyDeaths, dailydeaths];
            end
        end
    end                  
end


        