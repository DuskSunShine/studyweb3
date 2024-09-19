// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;
import "contracts/solidity/solidity102/callContract/OtherContract.sol";
contract CallContract{

    function callOtherSetX(address other,uint256 x)external {
        OtherContract(other).setX(x);
    }

    function interfaceCallOtherSetX(address other,uint256 x)external {
        Icontract(other).setX(x);
    }

    function callOtherGetX(OtherContract other) external view returns (uint256){
        return other.getX();
    }
    function callGetX2(address other) external view returns(uint x){
        OtherContract oc = OtherContract(other);
        x = oc.getX();
    }

     function setXTransferETH(address otherContract, uint256 x) payable external{
        OtherContract(otherContract).setX{value: x}(x);
    }



    receive() external payable { }
}