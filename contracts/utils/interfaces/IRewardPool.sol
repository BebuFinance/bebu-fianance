// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

interface IRewardPool {
    function BebuPerSecond() external returns (uint256);

    function totalAllocPoint() external returns (uint256);

}