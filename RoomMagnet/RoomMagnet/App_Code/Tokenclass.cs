﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Tokenclass
/// </summary>
public class Tokenclass
{
    public string access_token { get; set; }
    public string token_type { get; set; }
    public int expires_in { get; set; }
    public string refresh_token { get; set; }
    public Tokenclass()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}