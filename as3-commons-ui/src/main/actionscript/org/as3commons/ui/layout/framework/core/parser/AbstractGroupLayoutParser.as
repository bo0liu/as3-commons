/**
 * Copyright 2011 The original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.as3commons.ui.layout.framework.core.parser {

	import org.as3commons.ui.layout.framework.IGroupLayout;
	import org.as3commons.ui.layout.framework.core.cell.ICell;
	import org.as3commons.ui.layout.framework.core.config.CellConfigMerge;
	import org.as3commons.ui.layout.framework.core.row.IRow;

	/**
	 * @author Jens Struwe 17.03.2011
	 */
	public class AbstractGroupLayoutParser extends AbstractLayoutParser {
		
		protected var _RowType : Class;
		
		/*
		 * ILayoutParser
		 */
		
		override public function parseCell(cell : ICell) : void {
			CellConfigMerge.merge(cell.config, _layout.getCellConfig(_layoutCell.row.numItems));
			cell.measure();

			_layoutCell.row.add(cell);
		}
		
		/*
		 * Protected
		 */
		 
		override protected function createRow() : IRow {
			var row : IRow = new _RowType();

			row.config.minWidth = _layout.minWidth;
			row.config.minHeight = _layout.minHeight;
			row.config.gap = IGroupLayout(_layout).gap;
			row.config.hAlign = _layout.hAlign;
			row.config.vAlign = _layout.vAlign;

			return row;
		}

	}
}
