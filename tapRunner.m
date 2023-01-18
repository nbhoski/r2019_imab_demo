%MATLAB script with content:
import matlab.unittest.TestRunner;
import matlab.unittest.plugins.FailOnWarningsPlugin;
import matlab.unittest.plugins.TAPPlugin;
import matlab.unittest.plugins.TestReportPlugin;
import matlab.unittest.plugins.ToFile;
import matlab.unittest.plugins.ToStandardOutput

addpath(pwd,'source');
suite = testsuite(pwd,"IncludeSubfolders",true)
 
[~,~] = mkdir('artifacts');

if exist(fullfile(pwd, 'artifacts/result.tap'), 'file') == 2
   delete('artifacts/result.tap');
end

runner = TestRunner.withTextOutput('LoggingLevel', 1, 'OutputDetail', 4);
runner.addPlugin(FailOnWarningsPlugin());
runner.addPlugin(TestReportPlugin.producingPDF('artifacts/result.pdf'));
runner.addPlugin(TAPPlugin.producingVersion13(ToStandardOutput));
runner.addPlugin(TAPPlugin.producingVersion13(ToFile('artifacts/result.tap')));

 
results = runner.run(suite);
display(results);
%display(fileread('artifacts/result.tap'));

assertSuccess(results);

