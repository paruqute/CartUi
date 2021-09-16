

import 'package:cartui/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isClick;
  int quantity=0;
  String name,image,weight;
  int price,mrp;
  String productId;
  List<CartModel> data=[];
  addData(){
    data.add(CartModel(
        sellingPrice: 45,
        mrp: 50,
        name: "Yardlong Bean",
        image:"https://www.agrifarming.in/wp-content/uploads/2018/07/Yard-Long-Beans-Characterstics..jpg" ,
        weight: "500 g"
    ),);
    data.add(CartModel(
        sellingPrice: 40,
        mrp: 45,
        name: "Beans",
        image: "https://4.imimg.com/data4/QF/EV/MY-1473185/beans-500x500.jpg",
        weight: "500 g",
      quantity: 0,
    ),);
    data.add(CartModel(
        sellingPrice: 30,
        mrp: 40,
        name: "Cucumber",
        image:"https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3VjdW1iZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80" ,
        weight: "1 kg",
      quantity: 0,
    ),);
    data.add(CartModel(
        sellingPrice: 25,
        mrp: 28,
        name: "Onion",
        image:"https://m.economictimes.com/thumb/msid-81512028,width-810,height-568,resizemode-4,imgsize-1035649/onions.jpg" ,
        weight: "1 kg",
      quantity: 0,
    ),);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isClick=true;
    addData();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Fresh Vegetables",style: TextStyle(
              color: Colors.black,
              fontSize: 18
          ),),
          elevation: 0,
          leading: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.80,
                  child: ListView.builder(
                    itemCount:data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      productId=data[index].sId;
                      name=data[index].name;
                      image=data[index].image;
                      mrp=data[index].mrp;
                      price=data[index].sellingPrice;
                      weight=data[index].weight;
                      return Container(
                        height: 110,
                        //color: Colors.green,
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(

                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(

                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: NetworkImage(data[index].image),
                                        fit: BoxFit.cover)
                                  ),
                                 // child: Image.network(cartProvider.items[index].image,fit: BoxFit.contain,),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(data[index].name,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold
                                      ),),
                                      SizedBox(height: 5,),
                                      Text(data[index].weight,style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11
                                      ),),
                                      SizedBox(height: 5,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Row(
                                          children: [
                                            Text("Rs "+data[index].sellingPrice.toString(),style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold
                                            ),),
                                            SizedBox(width: 5,),
                                            Text("Rs "+data[index].mrp.toString(),style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.lineThrough
                                            ),),
                                           // SizedBox(width: 30,),


                                          ],
                                        ),
                                          GestureDetector(
                                            onTap:(){
                                              setState(() {
                                                Provider.of<CartProvider>(context,listen: false).addToCart(data[index]);
                                                if (data[index].isClick ==
                                                    null) {
                                                  data[index].isClick= true;
                                                } else {
                                                  data[index].isClick =
                                                  !data[index].isClick;
                                                }

                                              });
                                            },
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  data[index].isClick==false?Container(
                                                    height: 25,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        borderRadius: BorderRadius.circular(20)
                                                    ),
                                                    child: Center(
                                                      child: Text("BUY ",style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.bold
                                                      ),),
                                                    ),

                                                  ):Container(
                                                    height: 30,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,

                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap:(){
                                                            removeItem();
                                                          },
                                                          child: Container(
                                                            height:20,
                                                            width:20,

                                                            decoration: BoxDecoration(
                                                                color: Colors.grey.shade300,
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(30),
                                                                  bottomLeft: Radius.circular(30),
                                                                )
                                                            ),
                                                            child: Center(
                                                              child: Text("-",style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 2,),
                                                        Container(
                                                          height:20,
                                                          width:20 ,
                                                          child: Center(
                                                            child: Text(quantity.toString(),style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 11,
                                                                fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap:(){
                                                            addQty();
                                                          },
                                                          child: Container(
                                                            height:20,
                                                            width:20,

                                                            decoration: BoxDecoration(
                                                                color: Colors.grey.shade300,
                                                                borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(30),
                                                                  bottomRight: Radius.circular(30),
                                                                )
                                                            ),
                                                            child: Center(
                                                              child: Text("+",style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(color: Colors.black,thickness: 0.2,)
                          ],
                        )
                      );
                    },),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadiusDirectional.circular(30)
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(cartProvider.cartLength.toString()+"  items.",style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(width: 5,),
                          Text("Rs"+cartProvider.total.toString(),style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(width: 10,),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Text("Checkout.",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },);
  }
  void addQty() {
    setState(() {
      quantity += 1;
      Provider.of<CartProvider>(context,listen: false).addQuantity(productId);
    });
  }

  void removeItem() {
    setState(() {
      if (quantity != 0) {
        quantity -= 1;

        Provider.of<CartProvider>(context,listen: false).reduceQuantity(productId);

      }
    });
  }
}
