// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract PaymentToken {
    // ERC20 Standard-Daten
    string private _name = "PaymentToken";
    string private _symbol = "PAY";
    uint8 private _decimals = 18;
    
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 public constant TOKENS_PER_ETH = 1000;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        uint256 initialSupply = 1_000_000 * 10 ** _decimals;
        _totalSupply = initialSupply;
        _balances[address(this)] = initialSupply;
        emit Transfer(address(0), address(this), initialSupply);
    }

    // ERC20 Standard-Getters
    function name() public view returns (string memory) {
        return _name;
    }
    
    function symbol() public view returns (string memory) {
        return _symbol;
    }
    
    function decimals() public view returns (uint8) {
        return _decimals;
    }
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
    
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    // PaymentToken-spezifische Funktion
    function buyTokens() external payable {
        require(msg.value > 0, "No ETH sent");
        uint256 tokenAmount = msg.value * TOKENS_PER_ETH;
        require(_balances[address(this)] >= tokenAmount, "Not enough tokens");

        _balances[address(this)] -= tokenAmount;
        _balances[msg.sender] += tokenAmount;

        emit Transfer(address(this), msg.sender, tokenAmount);
    }

    // ERC20 Standard-Funktionen
    function approve(address spender, uint256 amount) external returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(_balances[msg.sender] >= amount, "Balance too low");
        _balances[msg.sender] -= amount;
        _balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool) {
        require(_balances[from] >= amount, "Balance too low");
        require(_allowances[from][msg.sender] >= amount, "Allowance too low");

        _allowances[from][msg.sender] -= amount;
        _balances[from] -= amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);
        return true;
    }
}