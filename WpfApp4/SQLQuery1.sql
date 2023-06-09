﻿CREATE PROCEDURE sp_UpdateBook
@myId INT,
@page INT
AS
BEGIN
	BEGIN TRANSACTION
	IF(EXISTS(SELECT * FROM Books WHERE Id=@myId))
	BEGIN
		PRINT 'Book Updated'
		UPDATE Books
		SET Pages=@page
		WHERE Id=@myId

		COMMIT TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'Book did not find'
		ROLLBACK TRANSACTION
	END
END