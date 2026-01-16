// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// @title NFTMinter
/// @notice Mintet ERC721-NFTs im Austausch gegen PaymentToken.
// TODO: Implementiere ERC721-Standard (z.B. via OpenZeppelin)
contract NFTMinter {
    uint256 private _tokenIdCounter;
    IERC20 public immutable paymentToken;

    /// @dev Preis: 50 ganze PaymentToken (mit 18 Dezimalstellen)
    uint256 public constant NFT_PRICE = 50 * 10**18;

    /// @notice Mintet ein NFT an die Adresse `to` gegen Zahlung von 50 PaymentToken.
    /// @param to Empfaenger-Adresse des NFTs.
    /// @param tokenURI Metadaten-URI des NFTs.
    /// @dev Der Aufrufer muss vorher `approve` oder `increaseAllowance` auf dem PaymentToken
    ///      fuer dieses Contract-Address gerufen haben.
    function mintNFT(address to, string memory tokenURI) external {
        // TODO: Überprüfe, dass `to` keine Null-Adresse ist

        // TODO: Ziehe PaymentToken ein (Contract muss zuvor von msg.sender authorisiert werden), gib ansonsten einen Fehler aus.

        // TODO: Inkrementiere den Token-ID-Counter und mint das NFT an `to` mit der neuen Token-ID und dem gegebenen tokenURI.
    }    
}
