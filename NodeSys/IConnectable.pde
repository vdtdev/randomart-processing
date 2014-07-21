/**
* Interface for Nodes that can be connected to other nodes
* @version 1.0.20130904
* @author Wade Harkins <vdtdev@gmail.com>
*/
interface IConnectable {  
  int getPortCount();
  PVector getPortPosition(int port);
  boolean getPortState(int port);
  Connection tracePort(int port);
  void linkPort(int port,Node target);
  void bindPort(int port,Connection c);  
}
