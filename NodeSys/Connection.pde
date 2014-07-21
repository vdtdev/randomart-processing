class Connection{
  private int edgeColor = color(0.75,0.75,0.75);
  public void setEdgeColor(int edge){
    edgeColor=edge;}
  public int getEdgeColor(){return this.edgeColor;}
  private Node head;
  private Node tail;
  private int portNumber;
  public Connection(Node head, Node tail, int port){
    this.head=head;
    this.tail=tail;
    this.portNumber=port;
    head.bindPort(port,this);
    tail.bindPort(port,this);
  }
  public void renderConnection(IConnectable node, int port){
    pushStyle();
    PVector a = node.getPortPosition(port);
    Node n = node.tracePort(port);
    PVector b = n.getPortPosition(port);
    line(a.x,a.y,b.x,b.y);
    popStyle();
  }
}  
  
