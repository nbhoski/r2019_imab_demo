classdef testSquareRoot_basic < matlab.unittest.TestCase
   
    methods (TestClassSetup)
        function addTestContentToPath(testCase)
            addpath(fullfile(getenv('WORKSPACE'),'source'));
        end
    end       
    
    
    methods (Test)
        function testValues(testCase)
            testCase.verifyEqual(squareRoot(16),4);
            %testCase.verifyEqual(squareRoot(65536),256);            
        end
        
    end
   
end

