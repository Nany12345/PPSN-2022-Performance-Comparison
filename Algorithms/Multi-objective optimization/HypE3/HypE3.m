classdef HypE3 < ALGORITHM
% <multi/many> <real/binary/permutation>
% Hypervolume estimation algorithm
% nSample --- 10000 --- Number of sampled points for HV estimation

%------------------------------- Reference --------------------------------
% J. Bader and E. Zitzler, HypE: An algorithm for fast hypervolume-based
% many-objective optimization, Evolutionary Computation, 2011, 19(1):
% 45-76.
%------------------------------- Copyright --------------------------------
% Copyright (c) 2022 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    methods
        function main(Algorithm,Problem)
            %% Parameter setting
            nSample = Algorithm.ParameterSet(10000);

            %% Generate random population
            Population = Problem.Initialization();
            % Reference point for hypervolume calculation
            RefPoint = zeros(1,Problem.M) + 2000;

            %% Optimization
            while Algorithm.NotTerminated(Population)
                MatingPool = TournamentSelection(2,Problem.N,-CalHV(Population.objs,RefPoint,Problem.N,nSample));
                Offspring  = OperatorGA(Population(MatingPool));
%                 RefPoint = max([Population.objs;Offspring.objs])*1.1;
                Population = EnvironmentalSelection3([Population,Offspring],Problem.N,RefPoint,nSample);
            end
        end
    end
end