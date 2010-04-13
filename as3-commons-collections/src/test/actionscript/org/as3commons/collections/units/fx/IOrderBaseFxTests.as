package org.as3commons.collections.units.fx {
	import org.as3commons.collections.framework.ICollectionFx;
	import org.as3commons.collections.framework.ICollectionIterator;
	import org.as3commons.collections.fx.events.CollectionEvent;
	import org.as3commons.collections.testhelpers.AbstractCollectionTest;
	import org.as3commons.collections.testhelpers.AbstractCollectionUnitTest;
	import org.as3commons.collections.testhelpers.CollectionEventListener;
	import org.as3commons.collections.testhelpers.TestItems;
	import org.as3commons.collections.units.ITestOrder;

	/**
	 * @author jes 22.03.2010
	 */
	public class IOrderBaseFxTests extends AbstractCollectionUnitTest {

		public function IOrderBaseFxTests(test : AbstractCollectionTest) {
			super(test);
		}
		
		private function get _order() : ITestOrder {
			return _test.collection as ITestOrder;
		}

		/*
		 * Initial state
		 */

		public function test_init() : void {
			assertTrue(_test.collection is ITestOrder);
			assertTrue(_test.collection is ICollectionFx);
		}

		/*
		 * Test remove first, last
		 */

		public function test_removeFirst_withEmptyCollection() : void {
			var listener : CollectionEventListener = new CollectionEventListener(_order);
			
			assertFalse(listener.eventReceived);
			_order.removeFirst();
			assertFalse(listener.eventReceived);

		}

		public function test_removeFirst() : void {
			_test.fillCollection(TestItems.itemArray(3));

			var listener : CollectionEventListener = new CollectionEventListener(_order);
			
			// remove first
			
			assertFalse(listener.eventReceived);
			_order.removeFirst();
			assertTrue(listener.eventReceived);
			assertEquals(1, listener.numEvents);
			var event : CollectionEvent = listener.event;
			assertEquals(CollectionEvent.ITEM_REMOVED, event.kind);
			assertStrictlyEquals(TestItems.object1, event.item);
			assertEquals(1, event.numItems);
			assertTrue(event.iterator() is ICollectionIterator);
			assertStrictlyEquals(TestItems.object2, event.iterator().next());
			assertTrue(listener.validateSize(2));

			// remove first
			
			assertFalse(listener.eventReceived);
			_order.removeFirst();
			assertTrue(listener.eventReceived);
			assertEquals(1, listener.numEvents);
			event = listener.event;
			assertEquals(CollectionEvent.ITEM_REMOVED, event.kind);
			assertStrictlyEquals(TestItems.object2, event.item);
			assertEquals(1, event.numItems);
			assertTrue(event.iterator() is ICollectionIterator);
			assertStrictlyEquals(TestItems.object3, event.iterator().next());
			assertTrue(listener.validateSize(1));

			// remove first
			
			assertFalse(listener.eventReceived);
			_order.removeFirst();
			assertTrue(listener.eventReceived);
			assertEquals(1, listener.numEvents);
			event = listener.event;
			assertEquals(CollectionEvent.ITEM_REMOVED, event.kind);
			assertStrictlyEquals(TestItems.object3, event.item);
			assertEquals(1, event.numItems);
			assertTrue(event.iterator() is ICollectionIterator);
			assertTrue(undefined === event.iterator().next());
			assertTrue(listener.validateSize(0));

			// remove first

			assertFalse(listener.eventReceived);
			_order.removeFirst();
			assertFalse(listener.eventReceived);

		}

		public function test_removeLast_withEmptyCollection() : void {
			var listener : CollectionEventListener = new CollectionEventListener(_order);
			
			assertFalse(listener.eventReceived);
			_order.removeLast();
			assertFalse(listener.eventReceived);

		}

		public function test_removeLast() : void {
			_test.fillCollection(TestItems.itemArray(3));

			var listener : CollectionEventListener = new CollectionEventListener(_order);
			
			// remove last
			
			assertFalse(listener.eventReceived);
			_order.removeLast();
			assertTrue(listener.eventReceived);
			assertEquals(1, listener.numEvents);
			var event : CollectionEvent = listener.event;
			assertEquals(CollectionEvent.ITEM_REMOVED, event.kind);
			assertStrictlyEquals(TestItems.object3, event.item);
			assertEquals(1, event.numItems);
			assertTrue(event.iterator() is ICollectionIterator);
			assertStrictlyEquals(TestItems.object2, event.iterator().previous());
			assertTrue(listener.validateSize(2));

			// remove last
			
			assertFalse(listener.eventReceived);
			_order.removeLast();
			assertTrue(listener.eventReceived);
			assertEquals(1, listener.numEvents);
			event = listener.event;
			assertEquals(CollectionEvent.ITEM_REMOVED, event.kind);
			assertStrictlyEquals(TestItems.object2, event.item);
			assertEquals(1, event.numItems);
			assertTrue(event.iterator() is ICollectionIterator);
			assertStrictlyEquals(TestItems.object1, event.iterator().previous());
			assertTrue(listener.validateSize(1));
			
			// remove last
			
			assertFalse(listener.eventReceived);
			_order.removeLast();
			assertTrue(listener.eventReceived);
			assertEquals(1, listener.numEvents);
			event = listener.event;
			assertEquals(CollectionEvent.ITEM_REMOVED, event.kind);
			assertStrictlyEquals(TestItems.object1, event.item);
			assertEquals(1, event.numItems);
			assertTrue(event.iterator() is ICollectionIterator);
			assertTrue(undefined === event.iterator().next());
			assertTrue(listener.validateSize(0));

			// remove last

			assertFalse(listener.eventReceived);
			_order.removeLast();
			assertFalse(listener.eventReceived);
		}

	}
}
