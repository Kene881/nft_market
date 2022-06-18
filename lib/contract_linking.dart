import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.0.1:7545";
  final String _wsUrl = "ws://10.0.0.1:7545/";
  final String _privateKey = "b1825ce58d51781617e2cf86bd745852ab8e1f324d808c50027df972e55154fe";

  Web3Client? _client;
  bool isLoading = true;

  String? _abiCode;
  EthereumAddress? _contractAddress;
  Credentials? _credentials;

  DeployedContract? _contract;
  ContractFunction? _createCard;
  ContractFunction? _getCardById;

  Card? deployedCard;

  // ContractFunction? _price;
  // ContractFunction? _setPrice;
  // ContractFunction? _name;
  // ContractFunction? _setName;

  // String? deployedName;
  // String? deployedPrice;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async { 
    String abiStringFile = await rootBundle.loadString("src/artifacts/Card.json"); 

    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]); 
    _contractAddress = EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]); 
  } 

  Future<void> getCredentials() async { 
    _credentials = await _client?.credentialsFromPrivateKey(_privateKey); 
  } 

  Future<void> getDeployedContract() async { 
    _contract = DeployedContract(ContractAbi.fromJson(_abiCode!, "CardList"), _contractAddress!);
    _createCard =_contract?.function("createCard");
    _getCardById = _contract?.function("getCardById");
  } 

  getCard(int id) async { 
    var currentCardValues = await _client?.call(contract: _contract!, function: _getCardById!, params: [id]); 
    deployedCard = Card(currentCardValues?[0], currentCardValues?[1], currentCardValues?[2], currentCardValues?[3]);
    isLoading = false; 
    notifyListeners(); 
  }

  createCard(String name, int price, String imageHash, String ipfs) async { 
    isLoading = true; 
    notifyListeners(); 
    await _client?.sendTransaction(_credentials!, Transaction.callContract(contract: _contract!, function: _createCard!, parameters: [name, price, imageHash, ipfs])); 
  }
}


class Card {
  String? imageHash;
  String? ipfsInfo;

  String? name;
  int? price;

  Card(String name, int price, String imageHash, String ipfsInfo) {
    this.imageHash = imageHash;
    this.ipfsInfo = ipfsInfo;
    this.name = name;
    this.price = price;
  }
}