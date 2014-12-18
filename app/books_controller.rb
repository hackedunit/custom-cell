class BooksController < UITableViewController
  
  def viewDidLoad
    super
    loadBooks
  end
  
  def numberOfSectionsInTableView(tableView)
    return 1
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @books.count
  end
  
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    book = @books[indexPath.row]
    @reuseIdentifier ||= "BookCell"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
    cell ||= CustomBookCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: @reuseIdentifier)
    cell.bookName.text = book[0].to_s
    cell.authorName.text = book[1].to_s
    cell.price.text = book[2].to_s
    cell
  end
  
  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  end
  
  private
  
  def loadBooks
    @books = [["Twelfth Night", "William Shakespeare", "$10"], ["Life on Earth", "E.O. Wilson", "$30"], ["Oliver Twist", "Charles Dickens", "$20"]]
  end
end