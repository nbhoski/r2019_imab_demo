function plan = buildfile
% Copyright 2023 The MathWorks, Inc.
 
import matlab.buildtool.tasks.*
import matlab.buildtool.Task;
 
plan = buildplan(localfunctions);

plan("check") = Task;
plan("check").Actions = @checkTask;
plan("check").Description = "Checks Description";
plan("test") = Task;
plan("test").Actions = @testTask;
plan("test").Description = "tests Dscription";
plan("test").Dependencies = ["check","show"];
plan("show") = Task;
plan("show").Description = "Shows the details"
plan("show").Actions = @showTask;

%plan("dsplay")

plan("clean") = CleanTask();
plan.DefaultTasks = ["check"];

function checkTask(~)
 % Identify code issues
disp("Hello Check");
end
function showTask(~)
 % Identify code issues
disp("Hello Show");
end

function testTask(~)
 % Identify code issues
disp("Hello test");
end
     
end
