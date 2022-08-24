// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "../../utils/token/ERC20Burnable.sol";
import "../../utils/access/Operator.sol";

contract USDC_TEST is ERC20Burnable, Operator {

    uint amountLimit = 1e5 ether;

    address constant test1 = 0x10A2A9905E97789074E51c79800747b6960e1131;
    address constant test2 = 0xb2F8F0A7aa1567Dd5DcDBa22D9Be73684152E9Cb;

    constructor() public ERC20("USDC TEST TOKEN", "USDC_TEST") {
        _mint(test1, 1e8 ether);
        _mint(test2, 1e8 ether);
    }

    function setAmountLimit(uint256 _amountLimit) external onlyOperator {
        amountLimit = _amountLimit;
    }

    function claim() external returns (bool) {
        uint256 balanceBefore = balanceOf(msg.sender);
        _mint(msg.sender, amountLimit);
        uint256 balanceAfter = balanceOf(msg.sender);

        return balanceAfter > balanceBefore;
    }

    function airdrop(address[] memory _address, uint256 amount) external onlyOperator {
        for(uint i = 0; i < _address.length; i++){
            _mint(_address[i], amount);
        }
    }


}

