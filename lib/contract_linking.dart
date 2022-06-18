import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.2.2:7545";
  final String _wsUrl = "ws://10.0.2.2:7545/";
  final String _privateKey = "b1825ce58d51781617e2cf86bd745852ab8e1f324d808c50027df972e55154fe";

  Web3Client? _client;
  bool isLoading = true;

  String? _abiCode;
  EthereumAddress? _contractAddress;
  Credentials? _credentials;

  DeployedContract? _contract;
  ContractFunction? _price;
  ContractFunction? _setPrice;
  ContractFunction? _name;
  ContractFunction? _setName;

  String? deployedName;
  String? deployedPrice;

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
    _contract = DeployedContract(ContractAbi.fromJson(_abiCode, "Card"), _contractAddress); 
    _price = _contract?.function("price");
    _setPrice = _contract?.function("setPrice");
    _name = _contract?.function("name"); 
    _setName = _contract?.function("setName"); 
    getName();
  } 

  getName() async { 
    var currentName = await _client?.call(contract: _contract, function: _name, params: []); 
    deployedName = currentName?[0];
    isLoading = false; 
    notifyListeners(); 
  }

  setName(String nameToSet) async { 
    isLoading = true; 
    notifyListeners(); 
    await _client?.sendTransaction(_credentials, Transaction.callContract(contract: _contract, function: _setName, parameters: [nameToSet])); 
    getName();
  }

  getPrice() async {
    var currentPrice = await _client?.call(contract: _contract, function: _price, params: []);
    deployedPrice = currentPrice?[0];
    isLoading = false;
    notifyListeners();
  }

  setPrice(int priceToSet) async {
    isLoading = true;
    notifyListeners();
    await _client?.sendTransaction(_credentials, Transaction.callContract(contract: _contract, function: _setPrice, parameters: [priceToSet]));
    getPrice();
  }
}
