clc; clear;
alg1 = @SMSEMOA2;
alg2 = @HypE2;
% alg0 = {@NSGAII,@MOEAD,@MOEADD,@NSGAIII,@DEAGNG,@PREA,@SparseEA,@RVEA};
% proNormal = {@DTLZ5,@DTLZ6,@DTLZ7,@WFG1,@WFG2,...
%     @WFG3};
% proMinus = {@MinusDTLZ5,@MinusDTLZ6,@MinusDTLZ7...
%     @MinusWFG1,@MinusWFG2,@MinusWFG3};
proNormal = {@DTLZ1,@DTLZ2,@DTLZ3,@DTLZ4,@DTLZ5,@DTLZ6,@DTLZ7,@WFG1,@WFG2,@WFG3, ...
    @WFG4,@WFG5,@WFG6,@WFG7,@WFG8,@WFG9};
proMinus = {@MinusDTLZ1,@MinusDTLZ2,@MinusDTLZ3,@MinusDTLZ4,@MinusDTLZ5,@MinusDTLZ6,@MinusDTLZ7...
    @MinusWFG1,@MinusWFG2,@MinusWFG3,@MinusWFG4,@MinusWFG5,@MinusWFG6,@MinusWFG7,@MinusWFG8,@MinusWFG9};
proMaF = {@MaF1, @MaF2, @MaF3, @MaF4, @MaF5, @MaF6, @MaF7, @MaF8, @MaF9,...
    @MaF10, @MaF11, @MaF12, @MaF13, @MaF14, @MaF15};
proRWMOP = {@RWMOP1,@RWMOP2,@RWMOP3,@RWMOP4,@RWMOP5,@RWMOP6,@RWMOP7,@RWMOP8,@RWMOP9,@RWMOP10, ...
    @RWMOP11,@RWMOP12,@RWMOP13,@RWMOP14,@RWMOP15,@RWMOP16,@RWMOP17,@RWMOP18,@RWMOP19,@RWMOP20, ...
    @RWMOP21};
proRE = {@RE21,@RE22,@RE23,@RE24,@RE25, ...
    @RE31,@RE32,@RE33,@RE34,@RE35,@RE36,@RE37, ...
    @RE41,@RE42,@RE61,@RE91};
popSizeRWMOP = [91*ones(1,7),120,100,91,112,91,120,91,91,91,120,91,120,91,91];
objNumRWMOP = [3*ones(1,7),4,2,3,6,3,4,3,3,3,4,3,4,3,3];
popSizeRE = [100*ones(1,5),91*ones(1,7),120*ones(1,2),112,174];
objNumRE = [2*ones(1,5),3*ones(1,7),4*ones(1,2),6,9];

runNum = 21;
obj = [3,5,8];
genNum = 100;
popSize = [91,210,156,275];

pro = proMinus;
alg = alg1;
for objInd = 1:2
    M = obj(objInd);
    N = popSize(objInd);
    caseNum = runNum*length(pro)*length(alg);
    parfor caseInd = 1:caseNum
        algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
        proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
        runInd = mod(caseInd-1,runNum)+1;
        algName = alg;
        proName = pro{proInd};
        fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
        if ~isfile(fileName)
            try
                platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
                    'maxFE',genNum*N,'save',1,'run',runInd);
                fprintf('M%d_%s_%s_%d\n',M,func2str(algName),func2str(proName),runInd);
            catch
                fprintf(2,'error: %s\n',fileName);
            end
        end
    end
end
pro = proMinus;
alg = alg2;
for objInd = 3
    M = obj(objInd);
    N = popSize(objInd);
    caseNum = runNum*length(pro)*length(alg);
    parfor caseInd = 1:caseNum
        algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
        proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
        runInd = mod(caseInd-1,runNum)+1;
        algName = alg;
        proName = pro{proInd};
        fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
        if ~isfile(fileName)
            try
                platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
                    'maxFE',genNum*N,'save',1,'run',runInd);
                fprintf('M%d_%s_%s_%d\n',M,func2str(algName),func2str(proName),runInd);
            catch
                fprintf(2,'error: %s\n',fileName);
            end
        end
    end
end

pro = proNormal;
alg = alg1;
for objInd = 1:2
    M = obj(objInd);
    N = popSize(objInd);
    caseNum = runNum*length(pro)*length(alg);
    parfor caseInd = 1:caseNum
        algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
        proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
        runInd = mod(caseInd-1,runNum)+1;
        algName = alg;
        proName = pro{proInd};
        fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
        if ~isfile(fileName)
            try
                platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
                    'maxFE',genNum*N,'save',1,'run',runInd);
                fprintf('M%d_%s_%s_%d\n',M,func2str(algName),func2str(proName),runInd);
            catch
                fprintf(2,'error: %s\n',fileName);
            end
        end
    end
end
pro = proNormal;
alg = alg2;
for objInd = 3
    M = obj(objInd);
    N = popSize(objInd);
    caseNum = runNum*length(pro)*length(alg);
    parfor caseInd = 1:caseNum
        algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
        proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
        runInd = mod(caseInd-1,runNum)+1;
        algName = alg;
        proName = pro{proInd};
        fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
        if ~isfile(fileName)
            try
                platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
                    'maxFE',genNum*N,'save',1,'run',runInd);
                fprintf('M%d_%s_%s_%d\n',M,func2str(algName),func2str(proName),runInd);
            catch
                fprintf(2,'error: %s\n',fileName);
            end
        end
    end
end

pro = proMaF;
alg = alg1;
for objInd = 1:2
    M = obj(objInd);
    N = popSize(objInd);
    caseNum = runNum*length(pro)*length(alg);
    parfor caseInd = 1:caseNum
        algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
        proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
        runInd = mod(caseInd-1,runNum)+1;
        algName = alg;
        proName = pro{proInd};
        fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
        if ~isfile(fileName)
            try
                platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
                    'maxFE',genNum*N,'save',1,'run',runInd);
                fprintf('M%d_%s_%s_%d\n',M,func2str(algName),func2str(proName),runInd);
            catch
                fprintf(2,'error: %s\n',fileName);
            end
        end
    end
end
pro = proMaF;
alg = alg2;
for objInd = 3
    M = obj(objInd);
    N = popSize(objInd);
    caseNum = runNum*length(pro)*length(alg);
    parfor caseInd = 1:caseNum
        algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
        proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
        runInd = mod(caseInd-1,runNum)+1;
        algName = alg;
        proName = pro{proInd};
        fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
        if ~isfile(fileName)
            try
                platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
                    'maxFE',genNum*N,'save',1,'run',runInd);
                fprintf('M%d_%s_%s_%d\n',M,func2str(algName),func2str(proName),runInd);
            catch
                fprintf(2,'error: %s\n',fileName);
            end
        end
    end
end

alg = @SMSEMOA; %[alg0,alg1];
pro = proRWMOP;
caseNum = runNum*length(pro)*length(alg);
parfor caseInd = 1:caseNum
    algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
    proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
    N = popSizeRWMOP(proInd);
    M = objNumRWMOP(proInd);
    if M>5
        algName = alg2;
    else
        algName = alg1;
    end
    proName = pro{proInd};
    runInd = mod(caseInd-1,runNum)+1;
    fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
    if ~isfile(fileName)
        try
            platemo('algorithm',algName,'problem',proName,'N',N,...
                'maxFE',genNum*N,'save',1,'run',runInd);
            fprintf('%s_%s_%d\n',func2str(algName),func2str(proName),runInd);
        catch
            fprintf('error: %s\n',fileName);
        end
    end
end

alg = @SMSEMOA; %[alg0,alg1];
pro = proRE;
caseNum = runNum*length(pro)*length(alg);
parfor caseInd = 1:caseNum
    algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
    proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
    N = popSizeRE(proInd);
    M = objNumRE(proInd);
    if M>5
        algName = alg2;
    else
        algName = alg1;
    end
    proName = pro{proInd};
    runInd = mod(caseInd-1,runNum)+1;
    fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
    if ~isfile(fileName)
        try
            platemo('algorithm',algName,'problem',proName,'N',N,...
                'maxFE',genNum*N,'save',1,'run',runInd);
            fprintf('%s_%s_%d\n',func2str(algName),func2str(proName),runInd);
        catch
            fprintf('error: %s\n',fileName);
        end
    end
end

% pro = proMinus;
% alg = [alg0,alg2];
% for objInd = 3
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         runInd = mod(caseInd-1,runNum)+1;
%         algName = alg{algInd};
%         proName = pro{proInd};
%         fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
%         if ~isfile(fileName)
%             try
%                 platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%                     'maxFE',genNum*N,'save',1,'run',runInd);
%                 fprintf('M%d_%s_%s_%d\n',M,func2str(algName),func2str(proName),runInd);
%             catch
%                 fprintf('error: %s\n',fileName);
%             end
%         end
%     end
% end

% pro = proRWMOP;
% caseNum = runNum*length(pro)*length(alg);
% parfor caseInd = 1:caseNum
%     algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%     proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%     N = popSizeRWMOP(proInd);
%     M = objNumRWMOP(proInd);
%     if M<6
%         alg = [alg0,alg1];
%     else
%         alg = [alg0,alg2];
%     end
%     algName = alg{algInd};
%     proName = pro{proInd};
%     runInd = mod(caseInd-1,runNum)+1;
%     fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
%     if ~isfile(fileName)
%         try
%             platemo('algorithm',algName,'problem',proName,'N',N,...
%                 'maxFE',genNum*N,'save',1,'run',runInd);
%             fprintf('%s_%s_%d\n',func2str(algName),func2str(proName),runInd);
%         catch
%             fprintf('error: %s\n',fileName);
%         end
%     end
% end
% 
% pro = proRE;
% caseNum = runNum*length(pro)*length(alg);
% parfor caseInd = 1:caseNum
%     algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%     proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%     runInd = mod(caseInd-1,runNum)+1;
%     N = popSizeRE(proInd);
%     M = objNumRE(proInd);
%     if M<6
%         alg = [alg0,alg1];
%     else
%         alg = [alg0,alg2];
%     end
%     algName = alg{algInd};
%     proName = pro{proInd};
%     fprintf('%s_%s\n',func2str(algName),func2str(proName));
%     platemo('algorithm',algName,'problem',proName,'N',N,...
%         'maxFE',genNum*N,'save',1,'run',runInd);
% end


% pro = proRWMOP2;
% alg = [alg0,alg2];
% caseNum = runNum*length(pro)*length(alg);
% parfor caseInd = 1:caseNum
%     N = 112; M = 6;
%     algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%     proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
% %     if proInd==9
% %         N = 100; M = 2;
% %     elseif proInd==8 || proInd==13 || proInd==16 || proInd==18
% %         N = 120; M = 4;
% %     else 
% %         N = 91; M = 3;
% %     end
%     algName = alg{algInd};
%     proName = pro{proInd};
%     runInd = mod(caseInd-1,runNum)+1;
%     fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
%     if ~isfile(fileName)
%         try
%             platemo('algorithm',algName,'problem',proName,'N',N,...
%                 'maxFE',genNum*N,'save',1,'run',runInd);
%             fprintf('%s_%s_%d\n',func2str(algName),func2str(proName),runInd);
%         catch
%             fprintf('error: %s\n',fileName);
%         end
%     end
% end
% 
% pro = proRWMOP2;
% alg = alg2;
% caseNum = runNum*length(pro)*length(alg);
% for caseInd = 1:caseNum
%     N = 112; M = 6;
%     algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%     proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%     algName = alg{algInd};
%     proName = pro{proInd};
%     runInd = mod(caseInd-1,runNum)+1;
%     fileName = sprintf('./Data1/%s/%s_%s_M%d_%d.mat',func2str(algName),func2str(algName),func2str(proName),M,runInd);
%     if ~isfile(fileName)
%         try
%             platemo('algorithm',algName,'problem',proName,'N',N,...
%                 'maxFE',genNum*N,'save',1,'run',runInd);
%             fprintf('%s_%s_%d\n',func2str(algName),func2str(proName),runInd);
%         catch
%             fprintf('error: %s\n',fileName);
%         end
%     end
% end

% pro = proMinus;
% alg = alg0;
% for objInd = 1:3
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         runInd = mod(caseInd-1,runNum)+1;
%         algName = alg{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1,'run',runInd);
%     end
% end
% 
% genNum = 500;
% pro = proMinus;
% alg = alg1;
% for objInd = 1:2
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         runInd = mod(caseInd-1,runNum)+1;
%         algName = alg{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1,'run',runInd);
%     end
% end
% pro = proMinus;
% alg = alg2;
% for objInd = 3
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         runInd = mod(caseInd-1,runNum)+1;
%         algName = alg{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1,'run',runInd);
%     end
% end

% pro = proMinus;
% for objInd = 1:3
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         algName = alg{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1);
%     end
% end













%%
% alg1 = {@R2HCAEMOA,@SMSEMOA};
% alg2 = {@R2HCAEMOA,@HypE};
% proNormal = {@DTLZ1,@DTLZ2,@DTLZ3,@DTLZ4,@WFG4,@WFG5,...
%     @WFG6,@WFG7,@WFG8,@WFG9};
% proMinus = {@MinusDTLZ1,@MinusDTLZ2,@MinusDTLZ3,@MinusDTLZ4,@MinusWFG4,@MinusWFG5,...
%     @MinusWFG6,@MinusWFG7,@MinusWFG8,@MinusWFG9};
% proRE1 = {@RE21,@RE22,@RE23,@RE24,@RE25, ...
%     @RE31,@RE32,@RE33,@RE34,@RE35,@RE36,@RE37, ...
%     @RE41,@RE42};
% proRE2 = {@RE61,@RE91};
% 
% runNum = 21;
% obj = [3,5,8,10];
% genNum = 500;
% popSize = [91,210,156,275];
% 
% pro = proNormal;
% for objInd = 1:2
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg1);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         algName = alg1{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1);
%     end
% end
% for objInd = 3:4
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg2);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         algName = alg2{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1);
%     end
% end
% 
% pro = proMinus;
% for objInd = 1:2
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg1);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         algName = alg1{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1);
%     end
% end
% for objInd = 3:4
%     M = obj(objInd);
%     N = popSize(objInd);
%     caseNum = runNum*length(pro)*length(alg2);
%     parfor caseInd = 1:caseNum
%         algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%         proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%         algName = alg2{algInd};
%         proName = pro{proInd};
%         fprintf('M%d_%s_%s\n',M,func2str(algName),func2str(proName));
%         platemo('algorithm',algName,'problem',proName,'M',M,'N',N,...
%             'maxFE',genNum*N,'save',1);
%     end
% end
% 

% pro = proRE;
% alg = alg0;
% caseNum = runNum*length(pro)*length(alg);
% parfor caseInd = 1:caseNum
%     algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%     proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%     runInd = mod(caseInd-1,runNum)+1;
%     N = 100;
%     if proInd<=5
%         N = 100;
%     elseif proInd>5 && proInd<=12
%         N = 91;
%     elseif proInd>12 && proInd<=14
%         N = 120;
%     elseif proInd==15
%         N = 112;
%     elseif proInd==16
%         N = 174;
%     end
%     algName = alg{algInd};
%     proName = pro{proInd};
%     fprintf('%s_%s\n',func2str(algName),func2str(proName));
%     platemo('algorithm',algName,'problem',proName,'N',N,...
%         'maxFE',genNum*N,'save',1,'run',runInd);
% end

% pro = proRE1;
% genNum = 500;
% alg = alg1;
% caseNum = runNum*length(pro)*length(alg);
% parfor caseInd = 1:caseNum
%     algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%     proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%     runInd = mod(caseInd-1,runNum)+1;
%     N = 100;
%     if proInd<=5
%         N = 100;
%     elseif proInd>5 && proInd<=12
%         N = 91;
%     elseif proInd>12 && proInd<=14
%         N = 120;
%     end
%     algName = alg{algInd};
%     proName = pro{proInd};
%     fprintf('%s_%s\n',func2str(algName),func2str(proName));
%     platemo('algorithm',algName,'problem',proName,'N',N,...
%         'maxFE',genNum*N,'save',1,'run',runInd);
% end
% 
% pro = proRE2;
% alg = alg2;
% caseNum = runNum*length(pro)*length(alg);
% parfor caseInd = 1:caseNum
%     algInd = floor((caseInd-1)/(runNum*length(pro)))+1;
%     proInd = mod(floor((caseInd-1)/runNum),length(pro))+1;
%     runInd = mod(caseInd-1,runNum)+1;
%     N = 100;
%     if proInd==1
%         N = 112;
%     elseif proInd==2
%         N = 174;
%     end
%     algName = alg{algInd};
%     proName = pro{proInd};
%     fprintf('%s_%s\n',func2str(algName),func2str(proName));
%     platemo('algorithm',algName,'problem',proName,'N',N,...
%         'maxFE',genNum*N,'save',1,'run',runInd);
% end