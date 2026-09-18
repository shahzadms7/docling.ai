# Synthetic source code sample for safe ingestion tests.
def reconcile(discovered: int, accounted: int) -> bool:
    """Return True only when every discovered item is explicitly accounted."""
    return discovered == accounted

if __name__ == "__main__":
    assert reconcile(5, 5)
