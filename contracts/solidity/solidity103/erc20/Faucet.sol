// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;
import "contracts/solidity/solidity103/erc20/IERC20.sol";

//我们将一些ERC20代币转到水龙头合约里，用户可以通过合约的requestToken()函数来领取100单位的代币，每个地址只能领一次。
contract Faucet {
    uint256 public amountAllowed = 100; //每次100单位代币
    address public tokenContract; //token合约地址
    mapping(address => bool) public requestedAddress; //记录领取过代币的地址

    //领取地址和数量
    event SendToken(address request, uint256 amount);

    // 部署时设定ERC20代币合约
    constructor(address _tokenContract) {
        tokenContract = _tokenContract; // set token contract
    }

    //注意接口不能实例化，不能new
    //如果你想与某个已经部署的 ERC20 合约进行交互，你需要使用该合约的地址来创建一个接口引用，
    //而不是实例化。你可以通过接口与已存在的合约进行交互
    function requestTokens() external {
        require(!requestedAddress[msg.sender], "Can't Request Multiple Times!"); // 每个地址只能领一次
        IERC20 token = IERC20(tokenContract);
        require(
            token.balanceOf(address(this)) >= amountAllowed,
            "Faucet Empty!"
        ); // 水龙头空了
        token.transfer(msg.sender, amountAllowed); //发送token
        requestedAddress[msg.sender] = true; // 记录领取地址
        emit SendToken(msg.sender, amountAllowed); // 释放SendToken事件
    }
}
