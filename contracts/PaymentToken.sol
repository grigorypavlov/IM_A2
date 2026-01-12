// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @title PaymentToken
/// @notice Fungible Token mit 18 Dezimalstellen, 1'000'000 * 10^18 Supply
///         und einfachem Verkauf gegen Ether (1000 Token = 1 ETH).
// TODO: Implementiere ERC20-Standard (z.B. via OpenZeppelin)
contract PaymentToken {

    /// @notice Kaufe PaymentToken gegen Ether.
    /// @dev 1 ETH = 1000 ganze Token (mit 18 Dezimalstellen).
    function buyTokens() external payable {
        require(msg.value > 0, "No ETH sent");

        // TODO: Berechne die Anzahl Tokens, die gekauft werden
        // msg.value ist in Wei; 1 ETH = 1e18 Wei
        // Wir wollen 1000 Token (mit 18 Dezimalstellen) pro 1 ETH.

        // TODO: Überprüfe, ob der Vertrag genug Token hat

        // TODO: Transferiere Tokens an msg.sender
    }
}
