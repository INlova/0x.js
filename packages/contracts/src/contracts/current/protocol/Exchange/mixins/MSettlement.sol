/*

  Copyright 2017 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

pragma solidity ^0.4.19;

import "../LibOrder.sol";

contract MSettlement is LibOrder {

    /// @dev Transfers a token using TokenTransferProxy transferFrom function.
    /// @param token Address of token to transferFrom.
    /// @param from Address transfering token.
    /// @param to Address receiving token.
    /// @param value Amount of token to transfer.
    /// @return Success of token transfer.
    function transferViaTokenTransferProxy(
        address token,
        address from,
        address to,
        uint value)
        internal
        returns (bool);

    /// @dev Checks if any order transfers will fail.
    /// @param order Order struct of params that will be checked.
    /// @param fillTakerTokenAmount Desired amount of takerToken to fill.
    /// @return Predicted result of transfers.
    function isTransferable(Order order, uint fillTakerTokenAmount)
        internal
        constant  // The called token contracts may attempt to change state, but will not be able to due to gas limits on getBalance and getAllowance.
        returns (bool);
}