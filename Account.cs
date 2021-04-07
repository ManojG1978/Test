using System;

namespace Solid_Master.State.Before
{
    class BankAccount
    {
        private Action OnUnfreeze { get; }

        public decimal Balance { get; private set; }
        public bool IsFrozen { get; private set; }
        public bool IsClosed { get; private set; }
        public bool IsVerified { get; private set; }
        
        public BankAccount(Action onUnfreezeAction)
        {
            OnUnfreeze = onUnfreezeAction;
        }

        public void Deposit(decimal amount)
        {
            if (IsClosed)
                return;
            Unfreeze();
            Balance += amount;
        }

        public void VerifyHolder()
        {
            IsVerified = true;
        }

        public void Withdraw(decimal amount)
        {
            if (!IsVerified)
                return;
            if (IsClosed)
                return;
            Unfreeze();
            Balance -= amount;
        }

        public void Unfreeze()
        {
            if (IsFrozen)
            {
                IsFrozen = false;
            }
            OnUnfreeze();
        }

        public void Freeze()
        {
            if (IsClosed)
                return;
            if (!IsVerified)
                return;
            IsFrozen = true;
        }

        public void Close()
        {
            IsClosed = true;
        }

    }
}
