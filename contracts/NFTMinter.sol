// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface IPaymentToken {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract NFTMinter {
    string public name = "PaymentNFT";
    string public symbol = "PNFT";
    uint256 public constant NFT_PRICE = 50 * 10 ** 18;

    IPaymentToken public paymentToken;
    uint256 private _tokenIdCounter;

    mapping(uint256 => address) public ownerOf;
    mapping(address => uint256) public balanceOf;
    mapping(uint256 => string) public tokenURI;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    constructor(address paymentTokenAddress) {
        paymentToken = IPaymentToken(paymentTokenAddress);
    }

    function mintNFT(address to, string calldata uri) external {
        require(to != address(0), "Invalid address");

        bool success = paymentToken.transferFrom(
            msg.sender,
            address(this),
            NFT_PRICE
        );
        require(success, "Payment failed");

        _tokenIdCounter++;
        uint256 tokenId = _tokenIdCounter;

        ownerOf[tokenId] = to;
        balanceOf[to] += 1;
        tokenURI[tokenId] = uri;

        emit Transfer(address(0), to, tokenId);
    }
}