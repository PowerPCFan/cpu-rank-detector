# Define CPU categories with wildcards
$cpuCategories = @{
    "lowEnd"   = @("*Celeron*", "*Pentium*", "*i3-*", "*i5-7*", "*i7-7*", "*i5-8*", "*i7-8*", "*i5-9*", "*i7-9*", "*ryzen 3*", "*ryzen 5 1*", "*ryzen 7 1*", "*ryzen 5 2*", "*ryzen 7 2*");
    "midRange" = @("*i5-10*", "*i7-10*", "*i9-10*", "*i5-11*", "*i7-11*", "*i9-11*", "*i5-12400", "*i5-13400", "*i5-14400", "*i5-12600*", "*i7-12700*", "*i9-12900*", "*ryzen 5 3*", "*ryzen 7 3*", "*ryzen 9 3*", "*ryzen 5 5*", "*ryzen 7 5*");
    "highEnd"  = @("*i5-13600", "*i5-14600", "*i5-13700", "*i5-14700", "*i5-13900", "*i5-14900", "*ryzen 7 5700x3d*", "*ryzen 7 5800x3d*", "*ryzen 5 7*", "*ryzen 7 7*", "*ryzen 9 7*", "*ryzen 7 7*x3d", "*ryzen 9 7*x3d");
}

# Function to categorize a CPU
function Get-CPURank {
    param (
        [string]$cpuName
    )
    # Detect AMD laptop CPUs with "U" in the name
    if ($cpuName -like "*Ryzen*U*") {
        return "laptop"
    }

    # Check against CPU categories
    foreach ($category in $cpuCategories.Keys) {
        foreach ($pattern in $cpuCategories[$category]) {
            if ($cpuName -like $pattern) {
                return $category
            }
        }
    }
    return "unknown"
}

# Detect CPU name
$cpuName = (Get-WmiObject Win32_Processor).Name

# Categorize the CPU and output only the category
Get-CPURank -cpuName $cpuName