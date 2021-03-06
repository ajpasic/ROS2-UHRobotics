# Agenda
1. Download MATLAB ROS example scripts
2. Create a ROS network
3. Create a subscriber

# ROS2 Terminology
### Networks
MATLAB enforces all of the core features of ROS: nodes, topics, and services. Nodes communicate with other nodes that are in the same network as them. Nodes don't have to belong to the same robot to communicate; networks can be distributed over many robots.

### Nodes
We previously defined a node as a computational building block that is responsible for processing data. MATLAB takes a more generic approach and just says
> A ROS 2 node is an entity that contains a collection of related ROS 2 capabilities (such as publishers and subscribers).

It's important to note that in the ROS communication framework, nodes communicate by sending and receiving messages through designated topics. Nodes that send messages are called *publishers*, while nodes that receive messages are called *subscribers*. A single topic can have multiple subscribers and publishers.

### Domains
ROS 2 networks can be distributed, so it's helpful to know how it is segmented. A domain is this physical segmentation. On creation, a node will advertise its existence to all other nodes *in the same domain*.

# ROS 2 Programming
Let's create a ROS 2 network in MATLAB. We begin by creating a single node. In the command window, type `test1 = ros2node("/test1")`. You can omit the leading `/`, MATLAB will automatically generate it. Your output will tell you that your node has the attributes
```
Name: '/test1'
ID: 0
```
The `/` alerts you that ROS 2 nodes are part of packages, and packages are stored in directories. We can't see the package that MATLAB has created for us, but we can still change some of its properties. Also note the ID defaults to 0. The ID of a node determines which domain it belongs to in our ROS network. Our network right now only consists of a single node, so let's fix that. Type in the command `exampleHelperROS2CreateSampleNetwork` to populate your ROS 2 network with more nodes. Use the commands `ros2 node list` to list all nodes and `ros2 topic list -t` to list all topics with their respective message types.

ROS 2 topics are associated with a message type. The message type defines the data contained in the message. You can view the contents of a message with the command `ros2 msg show <msg>`. You can even create a new message with the `ros2message` command. As an example, we'll create a laserScan message by typing `scanData = ros2message("sensor_msgs/LaserScan")`. Each message has a unique set of properties, or *fields*, that define the contents of that message. In this example, `range_min` and `range_max` are the minimum and maximum sensing distance of the laser scanner.

We will now create a subscriber to see how to implement this messaging system. In the command line, we will create a node and a corresponding subscriber node (more on that later) using the commands
```
controlNode = ros2node("/base_station")
poseSub = ros2subscriber(controlNode, "/pose", "geometry_msgs/Twist")
```
As a sanity check, try recreating poseSub with the message type `sensor_msgs/LaserScan` instead. What happens?

You can now type `poseData = receive(poseSub, 10)` to store the next message that poseSub receives into the variable poseData. The second argument is the timeout function, and it's there so that receive isn't always running in the background, waiting for a message that will probably never come. As a final example, we will use function handles to get around this issue. Re-create your pose subscriber `poseSub` with the commands
```
poseSub = ros2subscriber(controlNode, "/pose", @exampleHelperROS2PoseCallback);
global pos;
global orient;
```
Now the variables pos and orient will be updated whenever `poseSub` receives a message.
