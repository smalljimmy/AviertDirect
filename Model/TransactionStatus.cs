using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AviertDirect.Model
{
    public enum TransactionStatus
    {
        Pending = 1,
        Authorized = 2,
        Cancelled = 3,
        Rejected = 4,
        Unknown = 5
    }
}