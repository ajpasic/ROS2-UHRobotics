function exampleHelperROS2SimTimer(~, ~, handles)
    %exampleHelperROS2SimTimer - Timer update function called in startExamples to publish
    %   messages at well-defined intervals
    %   exampleHelperROS2SimTimer(~,~,HANDLES) publishes /pose and /scan messages at
    %   regular intervals. The /scan message value remains constant while
    %   the /pose message value changes continually.
    %   
    %   See also exampleHelperROS2CreateSampleNetwork
    
    %   Copyright 2019 The MathWorks, Inc.
    
    % Update the pose message values
    if isvalid(handles.twistPub)
        handles.twistPubmsg.linear.x = handles.twistPubmsg.linear.x + (rand(1)-0.5)./10;
        handles.twistPubmsg.linear.y = handles.twistPubmsg.linear.y + (rand(1)-0.5)./10;
        handles.twistPubmsg.linear.z = handles.twistPubmsg.linear.z + (rand(1)-0.5)./10;
        handles.twistPubmsg.angular.x = handles.twistPubmsg.angular.x + (rand(1)-0.5)./10;
        handles.twistPubmsg.angular.y = handles.twistPubmsg.angular.y + (rand(1)-0.5)./10;
        handles.twistPubmsg.angular.z = handles.twistPubmsg.angular.z + (rand(1)-0.5)./10;
    
        % Publish the scan and pose messages
        send(handles.twistPub,handles.twistPubmsg);
    end
       
    if isvalid(handles.scanPub)
        send(handles.scanPub,handles.scanPubmsg);
    end
end