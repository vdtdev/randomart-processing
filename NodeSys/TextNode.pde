class TextNode extends Node{
 
 private PVector[] portPos = PVector[4];
 private Connection[] links = Node[4];
 public int getPortCount(){return portPos.length;}
 public Node tracePort(int port){return links[port];}
 public Node linkPort(int port,Node target){
   if(target!=null && port<=getPortCount()){
     links[port]=target;
     target.linkPort(this,port);
   }
 } 
  
}
