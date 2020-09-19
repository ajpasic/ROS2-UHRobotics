function scanPubmsg = exampleHelperROS2LoadRanges()
    %exampleHelperROS2LoadRanges - Loads data for the laser scan message in startExamples
    %   
    %   See also exampleHelperROS2CreateSampleNetwork
    
    %   Copyright 2019 The MathWorks, Inc.
    
    laserfile = 'laserdata2.mat';
    lasercell = load(laserfile);
    scanPubmsg = lasercell.laserdata;
end